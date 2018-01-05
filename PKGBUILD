model="l8610cdw"
pkgname="brother-mfc-$model"
pkgver="1.2.0"
pkgrel=0
_revision=0
_revision_cups=0
pkgdesc="LPR and CUPS driver for the Brother MFC-8950DW"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
# install="brother-mfc-${model}.install"
depends=('rpmextract' 'a2ps' 'cups')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf103214/mfc${model}lpr-${pkgver}-${_revision}.i386.rpm"
        "http://download.brother.com/welcome/dlf103223/mfc${model}cupswrapper-${pkgver}-${_revision}.i386.rpm")
sha256sums=('27211c779effea39d5622f0683629faf44d7f62a4fee48b7ef3cc1935a00cde9'
            '124d1c07e0f7548ee01ad85fd650479b4f7040ac211df88a45bbc70c06c83736')

package() {
    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/

    install -m 755 -d $pkgdir/usr/lib/cups/filter
    ln -s /opt/brother/Printers/mfcl8610cdw/cupswrapper/brother_lpdwrapper_mfcl8610cdw $pkgdir/usr/lib/cups/filter
    install -m 755 -d $pkgdir/usr/lib32/cups/filter
    ln -s /opt/brother/Printers/mfcl8610cdw/cupswrapper/brother_lpdwrapper_mfcl8610cdw $pkgdir/usr/lib32/cups/filter
    install -m 755 -d $pkgdir/usr/libexec/cups/filter
    ln -s /opt/brother/Printers/mfcl8610cdw/cupswrapper/brother_lpdwrapper_mfcl8610cdw $pkgdir/usr/libexec/cups/filter
    install -m 755 -d $pkgdir/usr/share/cups/model
    ln -s /opt/brother/Printers/mfcl8610cdw/cupswrapper/brother-mfcl8610cdw-printer-en.ppd $pkgdir/usr/share/cups/model
    install -m 755 -d $pkgdir/usr/share/ppd/brother
    ln -s /opt/brother/Printers/mfcl8610cdw/cupswrapper/brother-mfcl8610cdw-printer-en.ppd $pkgdir/usr/share/ppd/brother
}

# prepare() {
#     # cd $srcdir
#     ls -lah
#     #
#     # deb2targz *.deb >/dev/null || return 1
#     # rm -f *.deb || return 1
#     # cd $srcdir || return 1
#     # [ -d "mfc${model}" ] || (mkdir mfc${model} || return 1)
#     # for i in *.tar.gz;do tar xfz $i -C mfc${model};done || return 1
# }

# package() {
#     # cd $srcdir || return 1
#     # cd mfc${model} || return 1
#     # cd opt/brother/Printers/MFC${model^^} || return 1
#     # perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/brother_lpdwrapper_MFC${model^^} || return 1
#     # perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${model}/opt/brother/Printers/MFC${model^^}/inf/setupPrintcap || return 1
#     # cp -rf $srcdir/mfc${model}/usr/ $pkgdir/ || return 1
#     # cp -rf $srcdir/mfc${model}/opt/ $pkgdir/ || return 1
#     #
#     # # symlinks 
#     # install -m 755 -d $pkgdir/usr/lib/cups/filter
#     # ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW $pkgdir/usr/lib/cups/filter
#     # install -m 755 -d $pkgdir/usr/lib32/cups/filter
#     # ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW $pkgdir/usr/lib32/cups/filter
#     # install -m 755 -d $pkgdir/usr/libexec/cups/filter
#     # ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother_lpdwrapper_MFC8950DW $pkgdir/usr/libexec/cups/filter
#     # install -m 755 -d $pkgdir/usr/share/cups/model
#     # ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother-MFC-8950DW-cups-en.ppd $pkgdir/usr/share/cups/model
#     # install -m 755 -d $pkgdir/usr/share/ppd/brother
#     # ln -s /opt/brother/Printers/MFC8950DW/cupswrapper/brother-MFC-8950DW-cups-en.ppd $pkgdir/usr/share/ppd/brother
# }
