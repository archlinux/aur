# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Zdenek Janecek <ycdmdj@gmail.com>

pkgname=brother-dcpt310
pkgver=1.0.1
pkgrel=3
pkgdesc="Driver for the Brother DCP-T310 multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('LicenseRef-Brother')
install="brother-dcpt310.install"
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'brscan4: making dcpt310 available to sane'
            'brscan-skey: scankey support if connected via usb')
depends_x86_64=('a2ps' 'cups' 'lib32-glibc' 'lib32-gcc-libs' 'bash' 'perl' 'ghostscript')
depends_i686=('a2ps' 'cups' 'bash' 'perl' 'ghostscript')

source=(
	"https://download.brother.com/welcome/dlf103619/dcpt310pdrv-$pkgver-0.i386.rpm"
)
sha256sums=('4a429a26c4c578580a78a6dcb56570e3e7aee66505ed40804ef18ace6d7853ed')

package()
{
	install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
	install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt310 "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}

