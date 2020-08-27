# Creator: Ahmed Aboul-Ela
# Maintainer: Jack R <rubacha.jack03@gmail.com>
pkgname=sublist3r
pkgver=1.1
pkgrel=1
pkgdesc="A python tool designed to enumerate subdoamins of websites using OSINT."
arch=('any')
url="https://github.com/aboul3la/Sublist3r"
license=('GPL')
depends=('python-requests' 'python-argparse' 'python-dnspython')
makedepends=('git')
source=('git+https://github.com/aboul3la/Sublist3r')
md5sums=('SKIP')

prepare() {
    mv ./Sublist3r ./sublist3r
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

