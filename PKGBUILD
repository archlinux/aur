# Maintainer: Hristo Voyvodov

pkgname=brother-mfct910dw
pkgver=1.0.1
pkgrel=2
pkgdesc='Brother MFC-T910dw CUPS driver'
arch=(x86_64)
url='https://support.brother.com'
license=('Unknown')
source=("https://download.brother.com/welcome/dlf103626/mfct910dwpdrv-1.0.0-0.i386.deb")
sha256sums=('0bb379f6bf5f19551e42e8c1bbfc7d59d30e56930d91163d0fd83e1d4fbc7f38')
depends=('cups' 'ghostscript')
noextract=()
install=$pkgname.install

prepare() {
    tar -zxvf data.tar.gz
}

package() {   
    install -d $pkgdir/opt/brother/Printers/mfct910dw/
    cp -r $srcdir/opt/brother/Printers/mfct910dw/* $pkgdir/opt/brother/Printers/mfct910dw/
    install -Dm755 "$srcdir/usr/bin/brprintconf_mfct910dw" "$pkgdir/usr/bin/brprintconf_mfct910dw"

    chmod 755 $pkgdir/opt/brother/Printers/mfct910dw/cupswrapper
    chmod 755 $pkgdir/opt/brother/Printers/mfct910dw/lpd
    chmod 755 $pkgdir/opt/brother/Printers/mfct910dw/inf
    chmod 755 $pkgdir/opt/brother/Printers/mfct910dw/
    chmod 755 $pkgdir/opt/brother/Printers
    chmod 755 $pkgdir/opt/brother
}   

