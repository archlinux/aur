pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.134
pkgrel=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/bdf2psf'
source=("ftp://ftp.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
md5sums=('1b6aa7e384133f872d814e6e7bd2529e')
depends=('perl')

build() {
	cd "$srcdir"
	tar -xf data.tar.xz
	patch "usr/bin/bdf2psf" "../argc-check.diff"
}

package() {
	cd "$srcdir"
	cp -r usr "$pkgdir"
}
