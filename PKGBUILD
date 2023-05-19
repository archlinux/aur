_base=wdb
pkgname=python-${_base}
pkgver=3.3.0
pkgrel=1
pkgdesc="An improbable web debugger through WebSockets (client only)"
arch=('any')
url="http://github.com/Kozea/${_base}"
license=(GPL3)
depends=(python-log_colorizer python-jedi)
makedepends=(python-setuptools)
source=("https://pypi.io/packages/source/${_base:0:1}/${_base}/${_base}-${pkgver}.tar.gz")
sha512sums=('19b2a46d64383c632d4e5b805594de3d8fe3779d6f270fe3232f24c82817e20aad1806a79222597645d5745c5b48b027e286db34478462cdf1c956cf7d4e1b9c')

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
