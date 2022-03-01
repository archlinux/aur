# Maintainer: Luis Miguel García-Cuevas González <luismiguelgcg at gmail dot com>

pkgname='python-gas_dynamics'
_name=${pkgname#python-}
pkgver=0.4.2
pkgrel=2
arch=('any')
pkgdesc='Gas dynamics equations, table generators, oblique shock chart generators and more.'
url='https://pypi.org/project/gas-dynamics/'
license=('MIT')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
)
depends=('python'
         'python-scipy'
         'python-matplotlib')
makedepends=('python-installer')
b2sums=('73064b3dc2ffd2f5271d39b151794ac03fc3f263bd754168cab81750ecf3bbb75121ec148b4ff0142b641be8a8347a6b53ba1244cfa9804302cda414aa487076'
)

build() {
  rm -r tests
}

package() {
  python -m installer --destdir="$pkgdir" ${_name}-$pkgver-py3-none-any.whl
}

