# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: f4iey <f4iey@f4iey.fr>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=not1mm
pkgver=24.2.1
pkgrel=1
pkgdesc="Ham Radio Contest Logger - Blatant ripoff of N1MM - Numbered Release"
license=('GPL')
arch=('any')
url="https://pypi.org/project/not1mm/"
depends=('python' 'python-pyqt5' 'python-requests' 'python-dicttoxml' 'python-xmltodict' 'python-psutil' \
	 'python-sounddevice' 'python-soundfile' 'python-numpy' 'python-notctyparser' 'python-pyserial' \
	 'python-gobject' 'gtk4' 'hamradio-menus')
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
md5sums=('8787ee2157aae2e77dc798e9c3e717a3')
sha256sums=('2f65c11cb42c3b48bce67f72ccb97856ea14b8c294d529a73b22e9a8fca6dd79')
