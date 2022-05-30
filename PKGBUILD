# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
_pkgname=remoteplaywhatever
pkgname=${_pkgname}-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
url="https://github.com/m4dEngi/RemotePlayWhatever"
depends=('wxgtk-common' 'wxgtk3')
source=(
  ${pkgname}-${pkgver}.deb::https://github.com/m4dEngi/${_pkgname}/releases/download/${pkgver}-alpha/${_pkgname}-${pkgver}-Linux.deb
)
sha512sums=('9ad789fa804535edb376258f062dd0f990a4fcbced65881444fa2812f06141112340a390780373e4d4e49702901bb3339bb6c3edac8b825f02b34f155d70db23')

prepare() {
  cd "$srcdir"
  tar xvf data.tar.gz
}

package() {
  cd "$srcdir/usr/bin"

  # binary
  install -D -m0755 remoteplaywhatever "${pkgdir}/usr/bin/remoteplaywhatever"

}

