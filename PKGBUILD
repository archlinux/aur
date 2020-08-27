# Creator: Ahmed Aboul-Ela
# Maintainer: Jack R <rubacha.jack03@gmail.com>
pkgname=sublist3r
pkgver=1.1
pkgrel=2
pkgdesc="A python tool designed to enumerate subdomains of websites using OSINT."
arch=('any')
url="https://github.com/aboul3la/Sublist3r"
license=('GPL2')
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
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

