# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-i3-quickterm
_name=${pkgname#python-}
pkgver=1.1
pkgrel=1
pkgdesc="A small drop-down terminal for i3wm and sway"
arch=('any')
url='https://pypi.org/project/i3-quickterm/'
license=('MIT')
depends=('python' 'python-i3ipc')
makedepends=('python-setuptools')
optdepends=('i3-wm' 'sway' 'dmenu' 'rofi')
source=("$_name-$pkgver.tar.gz::https://github.com/lbonn/$_name/archive/v${pkgver}.tar.gz")
sha256sums=('fcf327c35dfbf2b80c594ab1d68970be47b638249fd669d0ca2fb39fcad3620a')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
