pkgname=stm32pio
pkgver=1.30
pkgrel=1
pkgdesc="Automate managing of STM32CubeMX + PlatformIO projects" 
arch=('x86_64')
url="https://github.com/ussserrr/stm32pio"
license=('MIT')
depends=('python' 'pyside2' \
	'qt5-3d' 'qt5-base' 'qt5-charts' 'qt5-connectivity' \
	'qt5-datavis3d' 'qt5-declarative' 'qt5-doc' 'qt5-examples' \
	'qt5-gamepad' 'qt5-graphicaleffects'  'qt5-imageformats' \
	'qt5-location' 'qt5-lottie' 'qt5-multimedia'  'qt5-networkauth' \
	'qt5-purchasing' 'qt5-quick3d' 'qt5-quickcontrols' \
	'qt5-quickcontrols2' 'qt5-quicktimeline' 'qt5-remoteobjects' \
	'qt5-script' 'qt5-scxml'  'qt5-sensors' 'qt5-serialbus' \
	'qt5-serialport' 'qt5-speech' 'qt5-svg' 'qt5-tools' \
	'qt5-translations' 'qt5-virtualkeyboard' 'qt5-wayland' \
	'qt5-webchannel' 'qt5-webengine' 'qt5-webglplugin' \
	'qt5-websockets' 'qt5-webview' 'qt5-x11extras' 'qt5-xmlpatterns'
	)
makedepends=('python-setuptools')
#optdepends=('code: for text editing')
source=($pkgname-$pkgver.tar.gz::$url"/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')
build(){
	cd "$srcdir/$pkgname-$pkgver"
    	python setup.py build
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
    	python setup.py install --root="$pkgdir" --optimize=1 
	# license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

