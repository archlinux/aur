# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>

pkgname=mmenu
pkgver=r11.cd2ac79
pkgrel=1
pkgdesc="A dmenu wrapper which works like dmenu_run, but evaluates math you give it too"
arch=('any')
url="https://github.com/mortie/mmenu"
license=('unknown')
depends=('dmenu' 'python' 'xsel')
makedepends=('git')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/mmenu"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"
    install -Dm755 "mmenu/mmenu" "${pkgdir}/usr/bin/mmenu"
}
