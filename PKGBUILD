# Contributor <Jelle van der Waa jelle@vdwaa.nl>

pkgname=memleax
pkgver=1.1.1
pkgrel=1
pkgdesc="debugs memory leak of running process, without recompiling or restarting"
arch=('x86_64' 'i686')
url="https://github.com/WuBingzheng/memleax"
license=('GPL')
depends=('libunwind' 'libdwarf')
source=("https://github.com/WuBingzheng/memleax/archive/v$pkgver.tar.gz")
md5sums=('267bcb794968f328856a320cdb457cee')

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr/
	make
}

package() {
	cd "${pkgname}-${pkgver}"
        make DESTDIR="${pkgdir}" install
}
