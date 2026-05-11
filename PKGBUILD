# Maintainer: Will Handley <williamjameshandley@gmail.com>

pkgname=python-pyrubberband
_pkgname=pyrubberband
pkgver=0.4.0
pkgrel=1
pkgdesc='Python wrapper for rubberband (audio time-stretch and pitch-shift)'
arch=('any')
url='https://github.com/bmcfee/pyrubberband'
license=('ISC')
depends=(
  'python'
  'rubberband'
  'python-numpy'
  'python-soundfile'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/b4/5f/e4e737a216c9327931cdee8ca2194c916ee8a1748a8c7c80d5d5a8368d81/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('74707ec8ca6c6234e84ad2d9a4aa5c08a62fcfd83da011d535d41f4388ac49f7')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
