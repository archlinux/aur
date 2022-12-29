# Maintainer: nixi <nixi at cock dot li>

pkgname=ulozto-downloader
pkgver=3.3.0
pkgrel=1
pkgdesc='Uloz.to quick multiple sessions downloader'
arch=('any')
url='https://github.com/setnicka/ulozto-downloader'
license=('MIT')
depends=('tor' 'tk' 'python-requests' 'python-pillow' 'python-ansicolors' 'python-numpy' 'python-pysocks' 'python-stem')
optdepends=('python-tflite-runtime: automatic CAPTCHA solving')
makedepends=('python-setuptools')
source=("https://github.com/setnicka/ulozto-downloader/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('326d2a2aa7353dd90681bf3692fb6f2ecc55c9cc5f046d77ef2b88bab4a4b228')

package() {
	cd "$srcdir/ulozto-downloader-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
