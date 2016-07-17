# Maintainer: Florian Knodt <git [at] adlerweb [dot] info>

pkgname=stcgal
pkgver=1.2
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial' 'python-setuptools')
optdepends=('python-pyusb: Native USB programming support')
makedepends=('git')
source=("https://github.com/grigorig/stcgal/archive/v1.2.zip" 'LICENSE')
md5sums=('c942810581b77cf64983c645aa64b797' '79a3d9f649d76086966bde308915defa')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

