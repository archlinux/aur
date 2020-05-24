# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-pymultihash
_name=pymultihash
pkgver=0.8.2
pkgrel=1
pkgdesc="Python implementation of the multihash specification"
arch=('any')
url="https://pypi.python.org/pypi/pymultihash" license=('MIT')
depends=('python'
         'python-setuptools'
        )
checkdepends=()
source=("https://pypi.io/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    chmod -R a+r "$pkgdir" # upstream installer messes up permissions
}

sha256sums=('49c75a1ae9ecc6d22d259064d4597b3685da3f0258f4ded632e03a3a79af215b')
