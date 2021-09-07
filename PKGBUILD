# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pylink
pkgver=0.10.1
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
url="https://github.com/Square/pylink"
depends=('python'
         'python-future'
         'python-psutil'
         'python-setuptools'
         'python-six'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('c19795f9ef1b4716731883fd55b4b3640861a892bf4f5ad15a82552849299c6af16597e8aac6b36883effa6fcac9ed1be20ea75a582c4447da2680fbde495540')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

