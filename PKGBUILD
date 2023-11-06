# Maintainer: BoopyTheFox <boopy.the.fox@gmail.com>
pkgname='hyprpaper-gen-git'
pkgver=r3.e616709
pkgrel=1
pkgdesc="A simple script to automate hyprpaper config generation"
arch=('any')
url="https://gitlab.com/BoopyTheFox/hyprpaper-gen"
license=('GPL3')
depends=('bash' 'hyprpaper')
makedepends=('git')
optdepends=('hyprland: detect monitors with hyprctl')
source=('hyprpaper-gen::git+https://github.com/BoopyTheFox/hyprpaper-gen.git') 
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 ./hyprpaper-gen.sh "$pkgdir/usr/bin/hyprpaper-gen"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

