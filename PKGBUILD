# Maintainer: Florian Knodt <git [at] adlerweb [dot] info>

pkgname=stcgal
pkgver=1.9
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial' 'python-setuptools' 'python-tqdm')
optdepends=('python-pyusb: Native USB programming support')
makedepends=('git')
source=("https://github.com/grigorig/${pkgname}/archive/v${pkgver}.zip" 'LICENSE')
sha256sums=('573cb349a2b3739b122b8d0a68e872e8631d9f73a86be2e274a82bab8dfff156'
            'febf76eb588a5ac4db2fe052c5aadc85a3a8ae90197d9eafdcf400574eb4302e')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

