# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.12.1
pkgrel=2
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://arviz-devs.github.io/arviz/"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.5' 'python-numpy' 'python-scipy' 'python-xarray-einstats' 'python-matplotlib' 'python-netcdf4')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/v${pkgver}.tar.gz")
sha256sums=('4135b21ebc26a2632ba39fefc6cb987bffbe01f53d7c75ca58b2640576c9113b')


build() {
  cd arviz-${pkgver}
  python setup.py build
}

package() {
  cd arviz-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

