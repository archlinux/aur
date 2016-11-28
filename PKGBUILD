# Maintainer: Mirco Tischler <mt-ml@gmx.de>

pkgname=brother-dcpj4110dw
pkgver=3.0.1
pkgrel=3
pkgdesc="Driver for the Brother DCP-J4110DW wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj4110dw.install"
arch=('i686' 'x86_64')

md5sums=('9f802620c569d816433337ad4f505fb6'
         '7adc8bdd0649158b9e494142e9f36150')

source=("http://download.brother.com/welcome/dlf005594/dcpj4110dwlpr-$pkgver-1.i386.rpm"
	"http://download.brother.com/welcome/dlf005596/dcpj4110dwcupswrapper-$pkgver-1.i386.rpm"
)

package()
{
    install -d $pkgdir/usr/bin
    install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj4110dw "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
}
