# Maintainer: redponike <proton (dot) me>
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pystan
_pkgname=${pkgname#python-}
pkgver=3.10.0
pkgrel=1
pkgdesc="Python interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=('GPL-3.0')
depends=('python-numpy' 'cython' 'python-clikit' 'python-pysimdjson' 'python-aiohttp' 'python-httpstan')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2e6c1cdbec8b2769f134b35a19e59e6655074da0c2f807af78dc310a99a8eb79')

build() {
    cd ${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
