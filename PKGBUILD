# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=minimal-podcasts-player
pkgver="0.4.0"
pkgrel=1
pkgdesc="Subscribe, listen and (in the future) download your favorite podcasts, quickly and easily."
arch=('any')
url="https://github.com/son-link/minimal-podcasts-player"
license=('GPL3')
depends=('python' 'python-podcastparser' 'python-pyqt5' 'qt5-multimedia')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('9811e58d1e10b7fc460e08d411fb6d56ac961ec81fe0dabad99758f216d49106')

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
