# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=ffiler-git
pkgver=r34.16221b1
pkgrel=1
pkgdesc='Sort files into structured directory tree'
arch=('any')
url='https://github.com/fukawi2/ffiler'
license=('MIT')
depends=('bash')
makedepends=('git')
source=('git+https://github.com/fukawi2/ffiler.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 ffiler.sh "${pkgdir}/usr/bin/ffiler"
    install -Dm644 ffiler.man "${pkgdir}/usr/share/man/man7/ffiler.7"
}
