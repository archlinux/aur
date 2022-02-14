# Maintainer: Corentin Cadiou <contact@cphyc.me>

pkgname=python-cmyt
_module_name=cmyt
pkgver=1.0.4
pkgrel=1
pkgdesc="A collection of Matplotlib colormaps from the yt project."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=(python-colorspacious python-matplotlib python-more-itertools python-numpy)
makedepends=()
optdepends=()
options=(!emptydirs)
source=("https://pypi.io/packages/source/c/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('ae5157d37e733ae55df12bad1e8aedb3eb2f3b45e829e25c83df023dcefd5926')

build() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
