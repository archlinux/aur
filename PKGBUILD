# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
_pkgname=remoteplaywhatever
pkgname=${_pkgname}-bin
pkgver=0.1.16
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
depends=('wxwidgets-common' 'wxwidgets-gtk3')
source=(
  ${pkgname}-${pkgver}.deb::https://github.com/m4dEngi/${_pkgname}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb
)
sha512sums=('6c1534c15a0f4bc4d783eb187f6e65e1eaae4fe511f443d1cc09835999c6797eaba89bed6b08d1af977a7968b213b2aee354dc048919f46f00e897609713b20e')

prepare() {
  cd "$srcdir"
  tar xvf data.tar.gz
}

package() {
  cd "$srcdir/usr/bin"

  # binary
  install -D -m0755 remoteplaywhatever "${pkgdir}/usr/bin/remoteplaywhatever"

}

