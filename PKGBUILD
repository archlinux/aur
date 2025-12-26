# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: f4iey <f4iey@f4iey.fr>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=not1mm
pkgver=25.12.23
pkgrel=1
pkgdesc="Ham Radio Contest Logger - Blatant ripoff of N1MM - Numbered Release"
license=('GPL-3.0-only')
arch=('any')
url="https://pypi.org/project/not1mm/"
depends=('python' 'python-pyqt5' 'python-pyqt6' 'python-requests' 'python-dicttoxml' 'python-xmltodict' 'python-psutil' \
	 'python-sounddevice' 'python-soundfile' 'python-numpy' 'python-notctyparser' 'python-pyserial' 'python-appdata' \
	 'python-gobject' 'python-thefuzz' 'python-levenshtein' 'python-sh' 'python-adif-io' 'gtk4' 'hamradio-menus')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('hamlib' 'flrig')
provides=('not1mm')
conflicts=('not1mm-git' 'python-not1mm' 'not1mm-9m2pju-git')
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
md5sums=('9f74dc165775f4ee477891367c0ec985')
sha256sums=('7dd6625b7e0572e58462e3a132b8c0937f00a94479e99f3fd7435220c5dfab69')
