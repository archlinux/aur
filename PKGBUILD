# Maintainer: Rafael Silva <perigoso@riseup.net>

_modulename='sphinxcontrib.asciinema'
pkgname="python-${_modulename/./-}"
pkgver=0.3.7
pkgrel=1
pkgdesc='Embed asciinema casts in your Sphinx docs.'
arch=('any')
url="https://github.com/divi255/sphinxcontrib.asciinema"
license=('MIT')
depends=(
  'python-sphinx'
)
makedepends=(
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_modulename::1}/${_modulename}/${_modulename}-${pkgver}.tar.gz")
b2sums=('6722d0bf535368b9e1e62000eff874a7480b3c8d4842419bd45fb1a6fbee9c7ea2daf5789e47b090ff89598084ddca0a4bd42862fffd7a6b7b5d609e4bb0268a')

build() {
  cd "${_modulename}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_modulename}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
