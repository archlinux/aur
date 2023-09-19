# Maintainer: RinasSam <rinassam@duck.com>
# Curl fails to download this package. Wget must be specified as the DLAGENT in makepkg.conf.
# To do that, add 'https::/usr/bin/wget -q --show-progress -t 3 --waitretry=3 --no-check-certificate -O %o %u'
# instead of the original 'https::' DLAGENT line in your makepkg.conf before attempting to install this package.


pkgname=ollydbg-bin
pkgver=2.00
pkgrel=2
pkgdesc="OllyDbg is a 32-bit assembler level analysing debugger for Microsoft® Windows®."
arch=(x86_64)
url="https://www.ollydbg.de/odbg200.zip"
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
