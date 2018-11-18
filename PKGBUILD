# Maintainer: Simone Gaiarin <simgunz@gmail.com>
pkgname=ktouch-lesson-generator-git
pkgver=1
pkgrel=1
pkgdesc="A script for automatically generating custom lessons for the typing tutor KTouch."
arch=('any')
url="https://github.com/simgunz/ktouch-lesson-generator"
license=('MIT')
depends=('python-voluptuous' 'python-docopt')
source=("git+https://github.com/simgunz/ktouch-lesson-generator.git")
md5sums=('SKIP')

prepare() {
    cd "${pkgname%-git}"
    mv ktouch-lesson-generator.py ktouch-lesson-generator
}

package() {
    cd "${pkgname%-git}"
    install -D ktouch-lesson-generator "$pkgdir/usr/bin/ktouch-lesson-generator"
    install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/${pkgname%-git}/LICENSE.md
}
