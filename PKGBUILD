# Maintainer: Emil Miler <em@0x45.cz>

pkgname=ulozto-downloader
pkgver=3.3.1
pkgrel=2
pkgdesc='Uloz.to quick multiple sessions downloader'
arch=('any')
url='https://github.com/setnicka/ulozto-downloader'
license=('MIT')
depends=('tor' 'tk' 'python-requests' 'python-pillow' 'python-ansicolors' 'python-numpy' 'python-pysocks' 'python-stem')
optdepends=('python-tflite-runtime: automatic CAPTCHA solving')
makedepends=('python-setuptools')
source=("https://github.com/setnicka/ulozto-downloader/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('69a4aa80be18d259349eadb4875a52281c8920b867d9f7d4b6f33bf7bf9daa1e')

package() {
	cd "$srcdir/ulozto-downloader-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
