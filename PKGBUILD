pkgname=garfield-git

pkgver=1.0.0
pkgrel=1
license=('MIT')
pkgdesc='Simple, customizable garfield emulator.'
arch=('any')
url='https://github.com/sarahkittyy/garfield'
source=('garfield-git::git+https://github.com/sarahkittyy/garfield.git')
makedepends=('cmake>=3.13' 'gcc>=8.0' 'git>=2.0')
provides=('garfield')
md5sums=('SKIP')

build()
{
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake ..
	make
}

package()
{
	cd "$pkgname/build"
	pwd
	sudo make DESTDIR="$pkgdir/" install
}