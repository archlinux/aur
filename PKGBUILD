# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
_pkgname=remoteplaywhatever
pkgname=${_pkgname}-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
depends=('wxgtk-common' 'wxgtk3')
source=(
  ${pkgname}-${pkgver}.deb::https://github.com/m4dEngi/${_pkgname}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb
)
sha512sums=('9d3a72e289f6f8e7d51cee04d018b01e47e0b25193dcddf0e81c9d20053b88ba6885f2439c9da00b3889b2eaecc3220c5f7d3bd86e947d46d2ea72c0de4e6958')

prepare() {
  cd "$srcdir"
  tar xvf data.tar.gz
}

package() {
  cd "$srcdir/usr/bin"

  # binary
  install -D -m0755 remoteplaywhatever "${pkgdir}/usr/bin/remoteplaywhatever"

}

