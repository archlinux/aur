# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.6.1
pkgrel=1
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://arviz-devs.github.io/arviz/"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.5' 'python-numpy' 'python-scipy' 'python-xarray' 'python-matplotlib' 'python-netcdf4')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/${pkgver}.tar.gz")
sha256sums=('5c486f9696078e988c75ba53ac499cf717d657a1e0a24231d7edadb471e5edec')


build() {
  cd arviz-${pkgver}
  python setup.py build
}

package() {
  cd arviz-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

