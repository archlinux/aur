# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
pkgname=moz60tool-git
pkgver=r2.ac7d817
pkgrel=1
pkgdesc='tool for checking if JavaScript source code uses any Mozilla-specific extensions that will be removed in SpiderMonkey 60'
arch=('any')
url='https://gitlab.gnome.org/ptomato/moz60tool/'
license=('MIT')
depends=('gjs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/ptomato/moz60tool.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dt "$pkgdir/usr/bin/" moz60tool
    install -Dt "$pkgdir/usr/share/licenses/${pkgname}/" LICENSE
}
