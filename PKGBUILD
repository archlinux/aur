# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
pkgver=2.0.0.9706
pkgrel=2
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=('mono')
options=()
source=("MSAmanda_Standalone_LinuxMac_$pkgver.tar.gz::http://ms.imp.ac.at/index.php?file=MSAmanda_Standalone_LinuxMac_${pkgver}.tar.gz"
#       "LICENSE::http://ms.imp.ac.at/inc/pd-nodes/msamanda/LicenseAgreement_MSAmanda.rtf"
        "msamanda")
noextract=("MSAmanda_Standalone_LinuxMac_$pkgver.tar.gz")
md5sums=('3717055a0c874e8b59a1270e51bc9211'
#        '7f0bf2c30c4d78b18a0138df20050abf'
         'a870877935f5aed33fd0a7ec73e5abca')

prepare() {
    mkdir "MSAmanda"
    bsdtar -xf "MSAmanda_Standalone_LinuxMac_$pkgver.tar.gz" -C MSAmanda
    chmod -R o+rx MSAmanda
}

package() {
    mkdir "$pkgdir/opt"
    cp -rt "$pkgdir/opt/" "$srcdir/MSAmanda"
    install -D "$srcdir/msamanda" "$pkgdir/usr/bin/msamanda"
#   install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
