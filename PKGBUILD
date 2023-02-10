# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
_pkgname=remoteplaywhatever
pkgname=${_pkgname}-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
provides=('remoteplaywhatever')
depends=('wxwidgets-common' 'wxwidgets-gtk3' 'libtiff5')
source=(
  ${pkgname}-${pkgver}.deb::https://github.com/m4dEngi/${_pkgname}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb
)
sha512sums=('6266329ecce60f11d8b3fcf1e31cc9f16a1f9c222f0f8ede7fb15eb837846d3e97cc03a428244a2f73c6fedd3226e09b5ada5a5ae715965d55035054109eeadd')

prepare() {
  cd "$srcdir"
  tar xvf data.tar.gz
}

package() {
  cd "$srcdir/usr/bin"

  # binary
  install -D -m0755 remoteplaywhatever "${pkgdir}/usr/bin/remoteplaywhatever"

}

