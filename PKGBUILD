# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=shmux
pkgver=1.0.3
pkgrel=1
pkgdesc="shmux - executing the same command on many hosts in parallel."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/shmux/shmux"
license=('custom:3-clause BSD')
source=("https://github.com/shmux/shmux/archive/v${pkgver}.tar.gz")
sha512sums=('fb1dbb9701913fb97fb82914b9ae277703aec48cafdf74bcaa4a194ba242b62aff34e004507d6931475f320f89d62ed465360c0bc5cf2ff45abe7482b3127197')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
