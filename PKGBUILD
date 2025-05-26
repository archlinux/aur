# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-i3-quickterm
_name=${pkgname#python-}
pkgver=1.2
pkgrel=1
pkgdesc="A small drop-down terminal for i3wm and sway"
arch=('any')
url='https://pypi.org/project/i3-quickterm/'
license=('MIT')
depends=('python' 'python-i3ipc')
makedepends=('python-setuptools')
optdepends=('i3-wm' 'sway' 'dmenu' 'rofi')
source=("$_name-$pkgver.tar.gz::https://github.com/lbonn/$_name/archive/v${pkgver}.tar.gz")
sha256sums=('f1b92a817a928958eaccf165b7ab609e3959f6807334571661e1fe0f858ad079')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
