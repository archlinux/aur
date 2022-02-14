# Original maintainer: Stuart Mumford <stuart@cadair.com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-cmyt
_module_name=cmyt
pkgver=1.0.4
pkgrel=1
pkgdesc="Matplotlib colormaps from the yt project!"
arch=(any)
url="https://github.com/yt-project/cmyt"
license=('BSD')
depends=('python-colorspacious' 'python-matplotlib' 'python-more-itertools' 'python-numpy')
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
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
