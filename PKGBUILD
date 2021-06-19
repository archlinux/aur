# Maintainer: Daniel Mario <github.com/limadm>

pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.193~deb10u1
pkgrel=1
epoch=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/bdf2psf'
source=("http://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
md5sums=('6ef74a68e61b4bd5a16d534072381ff6')
depends=('perl')

build() {
	cd "$srcdir"
	tar -xf data.tar.xz
	sed -i '44s/if (/if (\$\#ARGV \< 0 \|\| /' usr/bin/bdf2psf
}

package() {
	cd "$srcdir"
	cp -r usr "$pkgdir"
}
