# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.174
pkgrel=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/bdf2psf'
source=("http://ftp.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
md5sums=('d2b285440fb109f230624bf4b9b70f58')
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
