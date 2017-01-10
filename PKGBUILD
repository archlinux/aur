# Maintainer: KeyboardFire <andy@keyboardfire.com>
pkgname=ppi3-git
pkgver=r3.c669816
pkgrel=1
pkgdesc='preprocessor for the i3 window manager'
arch=('any')
url='https://github.com/KeyboardFire/ppi3'
license=('GPL')
depends=('ruby')
makedepends=('git')
provides=('ppi3')
conflicts=('ppi3')
source=('ppi3::git+git://github.com/KeyboardFire/ppi3#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D ppi3.rb $pkgdir/usr/bin/ppi3
    install -Dm644 ppi3.1 $pkgdir/usr/share/man/man1/ppi3.1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
