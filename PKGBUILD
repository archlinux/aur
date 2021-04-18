pkgname=stm32pio
pkgver=2.1.0
pkgrel=1
pkgdesc="Automate managing of STM32CubeMX + PlatformIO projects" 
arch=('x86_64')
url="https://github.com/ussserrr/stm32pio"
license=('MIT')
depends=('python' 'pyside2' \
	'qt5-3d' 'qt5-base' \
	'qt5-datavis3d' 'qt5-declarative' \
	'qt5-graphicaleffects' 'qt5-imageformats' \
       	'qt5-quickcontrols' 'qt5-quickcontrols2' )
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm')
optdepends=('code: for text editing'
	'platformio: A cross-platform code builder and library manager')
source=("git+http://github.com/ussserrr/stm32pio.git")
md5sums=('SKIP')
build(){
	cd "$srcdir/$pkgname"
    	python setup.py build
}
package() {
	cd "$srcdir/$pkgname"
	# license
    	python setup.py install --root="$pkgdir" --optimize=1 
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

