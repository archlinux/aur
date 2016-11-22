pkgname=brother-dcpj4120dw
pkgver=3.0.1
pkgrel=2
pkgdesc="Driver for the Brother DCP-J4120DW wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
depends=('a2ps' 'cups')
install="brother-dcpj4120dw.install"
arch=('i686' 'x86_64')

md5sums=('e7c8ccb58d0f09ee35978d5079452e07'
	 '0a48b43137ca6fbe6a022a374ba1add0'
)

source=("http://download.brother.com/welcome/dlf101557/dcpj4120dwlpr-$pkgver-1.i386.rpm"
	"http://download.brother.com/welcome/dlf101558/dcpj4120dwcupswrapper-$pkgver-1.i386.rpm"
)

package()
{
    install -d $pkgdir/usr/bin
    install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj4120dw "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
}
