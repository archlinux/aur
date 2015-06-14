# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=xtandem
pkgver=15.04.01.1
pkgrel=3
pkgdesc="Software that can match tandem mass spectra with peptide sequences, in a process known as protein identification."
arch=('x86_64')
url="http://www.thegpm.org/TANDEM/"
license=('custom')
source=("ftp://ftp.thegpm.org/projects/tandem/source/tandem-linux-${pkgver//\./-}.zip"
        "xtandem.sh")
md5sums=('6f40a80f58ef710607075e112abcbeac'
         'ddde2d73df3b72f30d5906fefaeece09')
optdepends=('python-pyteomics.pepxmltk: a convenient wrapper for tandem.exe and a converter to pepXML')
package() {
	cd "tandem-linux-${pkgver//\./-}"
	install -Dt $pkgdir/usr/bin bin/*.exe
    install -m 644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/license.txt
    install -Dt $pkgdir/etc/profile.d ../xtandem.sh
}
