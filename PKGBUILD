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
sha512sums=('eac2d86cc77e27901a2cb1e0a79128ae9dbaeb4b36c053d159dc5ad5fdb8ea63bfbc2ac9d4d908bce34a72ceccb0d83b5338ae75ca6aba80c7ce083596f0fa90')

prepare() {
    sed -i 's/window.__is_debug = true/window.__is_debug = false/' "${srcdir}/${pkgname}-${pkgver}/dist/index.html"
    sed -i 's/window.__is_debug = true/window.__is_debug = false/' "${srcdir}/${pkgname}-${pkgver}/dist/monitor.html"
}

package() {
    mkdir -p "${pkgdir}/usr/share/web-greeter/themes/shikai/"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/"* "${pkgdir}/usr/share/web-greeter/themes/shikai/"
}
