# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=twint-git
pkgver=20200426.d9d0d68
pkgrel=1
pkgdesc="An advanced Twitter scraping & OSINT tool. (git version)"
url="https://github.com/twintproject/twint"
makedepends=('python-setuptools')
license=('MIT')
conflicts=('twint')
arch=('any')
source=("$pkgname::git+https://github.com/twintproject/twint.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pgkname"
    git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
