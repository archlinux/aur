# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.163
pkgrel=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/bdf2psf'
source=("ftp://ftp.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
sha1sums=('6f6a15f8bb7c626a2e3c312bf99fbbe333701c9a')
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
