# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.11.1
pkgrel=1
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://arviz-devs.github.io/arviz/"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.5' 'python-numpy' 'python-scipy' 'python-xarray' 'python-matplotlib' 'python-netcdf4')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/v${pkgver}.tar.gz")
sha256sums=('bbd1c701c476601799d2fd82f17bb9065a1ec170ff01fbf3eac57c299dac51db')


build() {
  cd arviz-${pkgver}
  python setup.py build
}

package() {
  cd arviz-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

