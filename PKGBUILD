# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=minimal-podcasts-player
pkgver="0.2.0"
pkgrel=1
pkgdesc="Subscribe, listen and (in the future) download your favorite podcasts, quickly and easily."
arch=('any')
url="https://github.com/son-link/minimal-podcasts-player"
license=('GPL3')
depends=('python' 'python-podcastparser' 'python-pyqt5' 'qt5-multimedia' 'python-qt-material-git')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d95b1c147a10de72c16cf3842555a6fb98ab25f41b6dd3752cc5d4d980484e1e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "bin/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "bin/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
