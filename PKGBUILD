# Maintainer: James Zhu <james.zhu.engineer@gmail.com>

pkgbase=python-pyrtlsdr
pkgname=(python-pyrtlsdr python2-pyrtlsdr)
_pkgname=pyrtlsdr
pkgver=0.2.4
pkgrel=1
pkgdesc="A Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
arch=(any)
url="http://pypi.org/project/pyrtlsdr"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pypandoc' 'python2-pypandoc')
options=(!emptydirs)
source=("https://github.com/roger-/$_pkgname/archive/v$pkgver.zip")
md5sums=('57b5f4e60262968e7e64b5cbe89e022f')

build() {
  cp -a $_pkgname-$pkgver{,-py2}
}

package_python-pyrtlsdr() {
  depends=('python' 'rtl-sdr')
  optdepends=('python-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pyrtlsdr() {
  depends=('python2' 'rtl-sdr')
  optdepends=('python2-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
