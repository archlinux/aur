# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: f4iey <f4iey@f4iey.fr>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=not1mm
pkgver=24.3.16
pkgrel=1
pkgdesc="Ham Radio Contest Logger - Blatant ripoff of N1MM - Numbered Release"
license=('GPL-3.0-only')
arch=('any')
url="https://pypi.org/project/not1mm/"
depends=('python' 'python-pyqt5' 'python-requests' 'python-dicttoxml' 'python-xmltodict' 'python-psutil' \
	 'python-sounddevice' 'python-soundfile' 'python-numpy' 'python-notctyparser' 'python-pyserial' \
	 'python-gobject' 'python-thefuzz' 'gtk4' 'hamradio-menus')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('hamlib' 'flrig')
provides=('not1mm')
conflicts=('not1mm-git' 'python-not1mm')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl

	# Desktop icon
	install -Dm755 "not1mm/data/k6gte-not1mm.desktop" "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
#	install -Dm755 "not1mm/data/k6gte.not1mm.svg" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.svg"
	install -Dm755 "not1mm/data/k6gte.not1mm-128.png" "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
}
md5sums=('b9feaeda88bd4c03a33de3e94a7cb224')
sha256sums=('7b80e69459da18d9e36a4ecbe5590e11f1a28dd8a631c7749b661aa2e9c1edbc')
