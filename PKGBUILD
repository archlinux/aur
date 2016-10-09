# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=bumprace
pkgver=1.5.5
pkgrel=1
pkgdesc="Arcade Game. You've got to get from the start to the finish line without crashing into deadly blocks."
arch=('x86_64' 'i686')
url="http://www.linux-games.com/bumprace"
license=('GPL2')
depends=('sdl' 'libjpeg-turbo' 'sdl_mixer' 'sdl_image')
source=("https://bitbucket.org/karlb/$pkgname/get/$pkgver.tar.gz")
sha512sums=('503a04c4f8e3537861af91f2978aae36267288b8db61fe55da6dd96003c11d585ef0632080bebddf482a34f32405b10354710541a9e140b0e614a5857dd6be10')

build() {
	cd karlb-$pkgname-034aca498e89
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
	make
}

package() {
	cd karlb-$pkgname-034aca498e89
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
	make DESTDIR="$pkgdir/" install
}
