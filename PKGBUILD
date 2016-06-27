# Contributor <Jelle van der Waa jelle@vdwaa.nl>

pkgname=memleax
pkgver=0.4
pkgrel=1
pkgdesc="debugs memory leak of running process, without recompiling or restarting"
arch=('x86_64' 'i686')
url="https://github.com/WuBingzheng/memleax"
license=('GPL')
depends=('libunwind' 'libdwarf')
source=("https://github.com/WuBingzheng/memleax/archive/v$pkgver.tar.gz")
md5sums=('87d993d585f8202f97dfb8a5a64c08f6')

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=${pkgdir}/usr/
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
