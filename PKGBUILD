# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.14.0
pkgrel=1
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://arviz-devs.github.io/arviz/"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.5' 'python-numpy' 'python-scipy' 'python-xarray-einstats' 'python-matplotlib' 'python-netcdf4')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f189994bb5d6857c9e78f7539d04b75c625fe6dd16c9fab6af0671b906019bca')


build() {
  cd arviz-${pkgver}
  python setup.py build
}

package() {
  cd arviz-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

