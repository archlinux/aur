# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

pkgbase='python-radioactivedecay'
pkgname=('python-radioactivedecay')
pkgver=0.4.17
pkgrel=1
pkgdesc='A Python package for radioactive decay modelling that supports 1252 radionuclides, decay chains, branching, and metastable states.'
arch=('any')
url='https://radioactivedecay.github.io/'
license=('MIT' 'custom:ICRP-07, AMDC')
source=("https://files.pythonhosted.org/packages/source/r/radioactivedecay/radioactivedecay-$pkgver.tar.gz")
sha256sums=('dfe474d53f02755a39b40a1bbb189175284f693e0423f64e40878632cf1c0379')
provides=("python-radioactivedecay=$pkgver")

build() {
  cd "${srcdir}"/radioactivedecay-$pkgver
  python setup.py build
} 

package_python-radioactivedecay() {
  depends=(
         'python>=3.9.0'
         'python-matplotlib'
         'python-networkx'
         'python-numpy'
         'python-scipy'
	       'python-setuptools'
         'python-sympy'
         'python-importlib_resources>=1.4')

  cd "${srcdir}"/radioactivedecay-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}