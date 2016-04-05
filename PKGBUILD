pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.141
pkgrel=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/bdf2psf'
source=("ftp://ftp.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
md5sums=('f28626b741f4766a6c4934f48c60cbc6')
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
