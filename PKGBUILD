# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot -de>

_pkgname=ruamel.base
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Common routines for ruamel Python packages"
arch=('any')
url="https://bitbucket.org/ruamel/base"
license=('MIT')
groups=('devel')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5b2fb0e7df10672eb2a48dc329f770ee')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py install --skip-build --root="$pkgdir" --optimize=1 \
    --single-version-externally-managed

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
