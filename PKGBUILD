# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=minimal-podcasts-player
pkgver="0.3.1"
pkgrel=1
pkgdesc="Subscribe, listen and (in the future) download your favorite podcasts, quickly and easily."
arch=('any')
url="https://github.com/son-link/minimal-podcasts-player"
license=('GPL3')
depends=('python' 'python-podcastparser' 'python-pyqt5' 'qt5-multimedia')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('39c1e1aaa97c8219ce1376f4041db847f82781b96bf81c16ad06da2afcf1c382')

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
