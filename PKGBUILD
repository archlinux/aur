# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com> (forked and modified PKGBUILD from brother-dcpj1200w)
# Maintainer: Manuel Conzelmann

pkgname=brother-dcpj1140dw
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-J1140W"
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcpj1140dw_eu_as"
license=('custom:brother')
depends=('cups')
install="$pkgname.install"
arch=('x86_64')
source=("https://download.brother.com/welcome/dlf105352/dcpj1140dwpdrv-3.5.0-1.i386.rpm")
sha256sums=('860d0e1a7203cb692c70dc47e8dbecdbb5541a6ae0dc115baf2943ffe44f7a14')

package()
{
    install -d $pkgdir/usr/bin
    install -Dm755 "$srcdir"/opt/brother/Printers/dcpj1140dw/lpd/$arch/brprintconf_dcpj1140dw "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
    mv "$srcdir"/opt/brother/Printers/dcpj1140dw/lpd/$arch/* "$srcdir"/opt/brother/Printers/dcpj1140dw/lpd
    rmdir "$srcdir"/opt/brother/Printers/dcpj1140dw/lpd/$arch
}
