# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>

model="l8900cdw"
pkgname="brother-mfc-${model}"
pkgver="1.2.0"
_cupsver="1.3.0"
pkgrel=0
_revision=0
epoch=1
pkgdesc="LPR and CUPS driver for the Brother MFC-L8900CDW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('EULA')
install="brother-mfc-${model}.install"
depends=('tcsh' 'perl' 'a2ps' 'lib32-libcups')
source=("mfc${model}lpr-${pkgver}-${_revision}.i386.rpm::http://download.brother.com/welcome/dlf103216/mfc${model}lpr-${pkgver}-${_revision}.i386.rpm"
        "mfc${model}cupswrapper-${_cupsver}-${_revision}.i386.rpm::http://download.brother.com/welcome/dlf103225/mfc${model}cupswrapper-${_cupsver}-${_revision}.i386.rpm")
sha256sums=('82cb8b3710523b546e40e1280275ecc1689b50294644d6b81a25cbffc385e8c4'
            'd92bbb84b6b66aad097b705dd6b2a53d19cab79fde546ad7a25e4952ee4547fa')


package() {
    cp -rf $srcdir/usr/ $pkgdir/ || return 1
    cp -rf $srcdir/opt/ $pkgdir/ || return 1
}
