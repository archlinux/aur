# Maintainer: Daniel Mario <github.com/limadm>

pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.205
pkgrel=1
epoch=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/stable/bdf2psf'
source=("http://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
depends=('perl')
sha512sums=('SKIP')

pkgver() {
	curl https://packages.debian.org/stable/bdf2psf | grep 'Package: bdf2psf (' | sed -e 's/.*(//' -e 's/).*//'
}

package() {
	tar -xf data.tar.xz
	mv $srcdir/usr $pkgdir
	sed -i '44s/if (/if (\$\#ARGV \< 0 \|\| /' $pkgdir/usr/bin/bdf2psf
}
