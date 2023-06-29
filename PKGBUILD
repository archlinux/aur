# Maintainer: Florian Knodt <git [at] adlerweb [dot] info>

pkgname=stcgal
pkgver=1.8
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial' 'python-setuptools' 'python-tqdm')
optdepends=('python-pyusb: Native USB programming support')
makedepends=('git')
source=("https://github.com/grigorig/${pkgname}/archive/v${pkgver}.zip" 'LICENSE')
sha256sums=('6f9287c28c8d723c36c122d81ea0547aafe51d09b15131b63b9f11377d2c438d'
            'febf76eb588a5ac4db2fe052c5aadc85a3a8ae90197d9eafdcf400574eb4302e')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

