# Maintainer: digital_mystik <dgtl_mystik at protonmail dot ch>

_name=simple-rlp
pkgname=python-simple-rlp
pkgver=0.1.3
pkgrel=1
pkgdesc="Encode and decode data structures"
arch=('any')
url="https://github.com/SamuelHaidu/simple-rlp"
license=("MIT")
depends=('python')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver::git+https://github.com/SamuelHaidu/simple-rlp.git#branch=master")

b2sums=('SKIP')

#source does not have tags currently
  
#pkgver() {
#    cd "${pkgname}"
#    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
