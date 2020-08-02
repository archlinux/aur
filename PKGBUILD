# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=romvault
pkgver=3.1.3
pkgrel=1
pkgdesc="RomVault is a tool for managing your ROMs and DATs for emulators, like libretro"
arch=('i686' 'x86_64')
url="http://www.romvault.com/"
license=('custom')
depends=('mono')

source=(${url}/download/ROMVault_V${pkgver}.zip
	"https://raw.githubusercontent.com/gjefferyes/RomVault/master/LICENSE"
	'LICENSE'
	'romvault.desktop'
	'romvault.png')

sha256sums=('f27392df2d1ce359d63366e47e7659e8e6ecc3a761f164a092f781b925c482f9'
	    '996bf0d32dc11506ea2635d64474c24399fab25933463f27d70cfa1d50431a16'
	    '996bf0d32dc11506ea2635d64474c24399fab25933463f27d70cfa1d50431a16'
	    '5d188d524030b25059db5002df184aed9b21667710876a87f3b7d5a8cb281154'
	    'd368d14e844f2dd6f5b2d04b31d9a70f0af6f3ec72669f5b6d98b161a8bec1d6')

package() {
    mkdir -p -m775 "${pkgdir}/opt/${pkgname}"
    cd "${pkgdir}/opt/${pkgname}"
    bsdtar -xf "${srcdir}/ROMVault_V${pkgver}.zip"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"
    install -D -m 644 ${srcdir}/romvault.desktop ${pkgdir}/usr/share/applications/romvault.desktop
    install -D -m 644 ${srcdir}/romvault.png ${pkgdir}/usr/share/pixmaps/romvault.png
    # chmod 644 *.exe
    # chmod -R 775 "DATRoot" "ROMRoot" "ToSort"
    # chown -R root:games "${pkgdir}/opt/${pkgname}"

    msg2 "Please create some subdirectorys ie. somewhere in your HOME and set"
    msg2 "these as your working area in programs settings."
    msg2 "---"
    msg2 "A documentation and some subsets of DAT files can be found at"
    msg2 "<https://github.com/mist-devel/mist-board/tree/master/rom_manager>"
    msg2 "and a video that shows a quick HowTo can be found at"
    msg2 "<http://www.youtube.com/embed/yUOIYYbZuAg>"
    msg2 "---"
    msg2 "You'll find more information about RomVault on it's home at <${url}> and"
    msg2 "at MiST's home at <https://github.com/mist-devel/mist-board/wiki/RomManagement>"
}
