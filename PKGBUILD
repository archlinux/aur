# Maintainer: Leo Pham <forgottenumbrella at tutanota dot com>

pkgname=brother-mfc-9335cdw
pkgver=1.1.4
pkgrel=5
pkgdesc='LPR and CUPS drivers for the Brother MFC-9335CDW'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
depends_x86_64=('lib32-libcups')
optdepends=('brscan4: scanning support'
            'brscan-skey: scanner interface (touchscreen/buttons) support')
makedepends=('rpmextract')
install='brother-mfc-9335cdw.install'
changelog='changelog.md'
source=('https://download.brother.com/welcome/dlf102675/mfc9335cdwlpr-1.1.3-0.i386.rpm'
        'https://download.brother.com/welcome/dlf102676/mfc9335cdwcupswrapper-1.1.4-0.i386.rpm')
md5sums=('8f37eaeb181e9f2993b719294e944dc5'
         '41108dca49edd1f014c54d9333048d4e')

package() {
    rpmextract.sh mfc9335cdwlpr-1.1.3-0.i386.rpm
    rpmextract.sh mfc9335cdwcupswrapper-1.1.4-0.i386.rpm
    mv $srcdir/usr/ $pkgdir/
    mv $srcdir/opt/ $pkgdir/
}
