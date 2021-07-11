#Maintainer <dgtl_mystik AT protomail DOT ch>

pkgname=python-firecfg-git
pkgver=v0.0.5.r0.gaa324e1
pkgrel=1
pkgdesc="An improved firecfg written in python."
arch=('any')
url="https://github.com/rusty-snake/firecfg.py"
license=("GPL3")
depends=('python' 'firejail')
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git+https://github.com/rusty-snake/firecfg.py.git#branch=master")

b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
