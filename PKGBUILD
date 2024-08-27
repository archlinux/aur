# Maintainer: Satakun Utama <linesofcodes[at]dailitation[dot]xyz>

_name=tkextrafont
pkgname=python-tkextrafont
pkgver=0.6.3
pkgrel=1
pkgdesc='Fonts loader for Tkinter'
arch=('x86_64')
url=https://pypi.org/project/tkextrafont/
license=('MIT AND GPL-3.0 AND LicenseRef-tkextrafont-license')
depends=(
  python
  fontconfig
  tcl
  tk
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  python-setuptools
  python-scikit-build
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/TkinterEP/python-tkextrafont/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('2db41fd56f4c19ce429bf06904e8a7275ee9e196881f01b6dfcccfb039c5a7e70400b46b4bac5fb48c402c837a14e2e133790bc4e66fb57e22a0007759366e7b')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  python setup.py install --root="$pkgdir" --optimize=1
}
