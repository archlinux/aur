pkgname=apio
_name=apio
pkgver=0.5.4
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=('python-click' 'python-pyserial' 'python-semantic-version'
         'python-pyjwt' 'python-colorama' 'python-requests' 'sudo' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('1c60390c863cb47651c921fccd57505e')

build() {
  cd "$pkgname-$pkgver"

  sed -i 's/click>=5,<7/click>=5,<8/g' ./setup.py
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"/  --optimize=1
}
