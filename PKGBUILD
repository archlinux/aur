# Maintainer: RinasSam <rinassam@duck.com>

pkgname=ollydbg-bin
pkgver=2.01
pkgrel=3
pkgdesc="OllyDbg is a 32-bit assembler level analysing debugger for Microsoft® Windows®."
arch=(x86_64)
url="http://www.ollydbg.de/odbg200.zip"
license=('custom')
depends=(wine)
makedepends=(unzip)
optdepends=('winetricks: download fonts and other Windows components')
provides=(ollydbg)
source=("$url")
sha256sums=('93dfd6348323db33f2005fc1fb8ff795256ae91d464dd186adc29c4314ed647c')
noextract=()


prepare()
{
  	unzip odbg200.zip -d ./odbg
}

package() {
	mkdir -p "${pkgdir}/usr/share/ollydbg"
	
 	install -Dm755 odbg/ollydbg.exe "${pkgdir}/usr/share/ollydbg/ollydbg.exe"
	install -Dm755 ../ollydbg "${pkgdir}/usr/bin/ollydbg"
}
