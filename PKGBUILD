# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
_pkgname=remoteplaywhatever
pkgname=${_pkgname}-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
depends=('wxgtk-common' 'wxgtk3')
source=(
  ${pkgname}-${pkgver}.deb::https://github.com/m4dEngi/${_pkgname}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb
)
sha512sums=('1b7ed420f9e4e7ac9a582cc3dc3db6348260e19283c38328d764cf63e47f37a47e8d14464ffaf2b2d3a1a06f4753e1c42add5b61e80e3020bba85a16378d9944')

prepare() {
  cd "$srcdir"
  tar xvf data.tar.gz
}

package() {
  cd "$srcdir/usr/bin"

  # binary
  install -D -m0755 remoteplaywhatever "${pkgdir}/usr/bin/remoteplaywhatever"

}

