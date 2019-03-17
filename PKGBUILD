# Maintainer: Leo Pham <forgottenumbrella at tutanota dot com>

pkgname=brother-mfc-9335cdw
pkgver=1.1.4
pkgrel=4
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
source=('http://download.brother.com/welcome/dlf102677/mfc9335cdwlpr-1.1.3-0.i386.deb'
        'http://download.brother.com/welcome/dlf102678/mfc9335cdwcupswrapper-1.1.4-0.i386.deb')
md5sums=('f993eb5322df2c9519a86ac0afcbb197'
         'f3afb684911c55a131532bb8cfdbc672')

package() {
    rpmextract mfc9335cdwlpr-1.1.3-0.i386.rpm
    rpmextract mfc9335cdwcupswrapper-1.1.4-0.i386.rpm
    mv $srcdir/usr/ $pkgdir/
    mv $srcdir/opt/ $pkgdir/
}
