# Maintainer: Simone Gaiarin <simgunz@gmail.com>
pkgname=ktouch-lesson-generator-git
pkgver=1.0.r0.gfb83fac
pkgrel=1
pkgdesc="A script for automatically generating custom lessons for the typing tutor KTouch."
arch=('any')
url="https://github.com/simgunz/ktouch-lesson-generator"
license=('MIT')
depends=('python-voluptuous' 'python-docopt')
source=("git+https://github.com/simgunz/ktouch-lesson-generator.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    mv ktouch-lesson-generator.py ktouch-lesson-generator
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D ktouch-lesson-generator "$pkgdir/usr/bin/ktouch-lesson-generator"
    install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE.md
}
