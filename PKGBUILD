# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=cpuled
pkgdesc="It's a program to let the keyboard LEDs indicate CPU load."
url='http://web.archive.org/web/20011210154318/www.sudac.org/~napolium/linux/'
pkgver=0.1
pkgrel=3
arch=('i686' 'x86_64')
depends=('glibc')
license='GPL'

source=("http://lara.craft.net.br/$pkgname-$pkgver.tar.gz"
	'fix-warnings.patch'
	'makefile_update.patch')
	
md5sums=('9b84e1903f2eb555006de0a5cb243c56'
         '5bcf6651c1d14457dab7c4ed564fffaa'
         '7d54f422517caa23d355483495558f19')

prepare() {
	cd "$srcdir"/$pkgname-$pkgver
	
	patch -Np0 -i ../fix-warnings.patch
	patch -Np0 -i ../makefile_update.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	
	make DESTDIR="$pkgdir" install
}
