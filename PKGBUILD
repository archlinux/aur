# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-app-bin
pkgver=0.21.10
pkgrel=1
pkgdesc="Minecraft mod manager and launcher from Modrinth (upstream binary)"
arch=('x86_64')
url="https://modrinth.com/app"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('modrinth-app')
conflicts=('modrinth-app')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/modrinth/code/releases/download/v${pkgver}/Modrinth.App_${pkgver}_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('f0114a4b820e9e27f31e7eb5ecbb9bfc40fc95555735fb7ed85210ad6f5ad135')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" usr
  ln -s ModrinthApp "$pkgdir/usr/bin/modrinth-app"
}
