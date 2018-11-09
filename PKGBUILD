# Maintainer: Florian Knodt <git [at] adlerweb [dot] info>

pkgname=stcgal
pkgver=1.6
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial' 'python-setuptools' 'python-tqdm')
optdepends=('python-pyusb: Native USB programming support')
makedepends=('git')
source=("https://github.com/grigorig/stcgal/archive/v1.6.zip" 'LICENSE')
md5sums=('318f2ca704327275b6f77a6248dfe284'
         'b76a68fb137f36d7b43624a0fe99cb2c')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

