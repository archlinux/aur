# Maintainer: Wisker <TheWisker@protonmail.com>
pkgname=shikai-theme
pkgver=v1.6.0
pkgrel=1
pkgdesc="Modern lightdm webkit2 theme"
arch=('any')
url="https://github.com/TheWisker/Shikai"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=('lightdm-webkit2-theme')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/TheWisker/Shikai#tag=${pkgver}")
noextract=()
validpgpkeys=()
sha512sums=('SKIP')

prepare() {
    sed -i 's/window.__is_debug = true/window.__is_debug = false/' "${srcdir}/${pkgname}-${pkgver}/dist/index.html"
    sed -i 's/window.__is_debug = true/window.__is_debug = false/' "${srcdir}/${pkgname}-${pkgver}/dist/monitor.html"
}

package() {
    mkdir -p "${pkgdir}/usr/share/web-greeter/themes/shikai/"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/"* "${pkgdir}/usr/share/web-greeter/themes/shikai/"
}
