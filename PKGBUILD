# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=goattracker
pkgver=2.75
pkgrel=1
pkgdesc="Crossplatform C64 music tracker. Included in this package are also the tools ins2snd2, mod2sng, sngspli2 and gt2reloc"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/goattracker2/"
license=('GPL')
depends=('sdl' 'gcc-libs')
source=("${pkgname}-${pkgver}.zip::http://sourceforge.net/projects/goattracker2/files/GoatTracker%202/${pkgver}/GoatTracker_${pkgver}.zip/download")
md5sums=('ab4a064ff60671081b4ca55c32b0a741')

build() {
	cd goattrk2/src
	make
}

package() {
	cd goattrk2

	mkdir -p "${pkgdir}/usr/bin/"
	install -D linux/{goattrk2,gt2reloc,ins2snd2,mod2sng,sngspli2} "${pkgdir}/usr/bin/"

	mkdir -p "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "goat_tracker_commands.pdf" "${pkgdir}/usr/share/goattracker/"
	install -d "examples" "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "readme.txt" "${pkgdir}/usr/share/goattracker/README"
}
