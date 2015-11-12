# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=pypi2deb-git
pkgver=1.20151008.r1.g2cea25b
pkgrel=1
pkgdesc="generate debian source packages from pypi python packages"
arch=(any)
url="https://github.com/p1otr/pypi2deb"
license=('MIT')
depends=('python')
makedepends=('python')
optdepends=()
install=
source=("git+https://github.com/p1otr/pypi2deb.git"
        "setup.py" )
sha256sums=('SKIP'
            'da2a108e8e4063acd2b550506a3c4bf21d89fbe675b0f5a1d72eebd706ebbb4d')

pkgver() {
   cd "$srcdir/${pkgname%-git}"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   cp setup.py "$srcdir/${pkgname%-git}"
}

package() {
   cd "$srcdir/${pkgname%-git}"
   python setup.py install --root="$pkgdir/" --optimize=1
}
