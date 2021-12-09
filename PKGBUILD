# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=goattracker
pkgver=2.76
pkgrel=1
pkgdesc="Crossplatform C64 music tracker. Included in this package are also the tools ins2snd2, mod2sng, sngspli2 and gt2reloc"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/goattracker2/"
license=('GPL')
depends=('sdl' 'gcc-libs')
source=("${pkgname}-${pkgver}.zip::http://sourceforge.net/projects/goattracker2/files/GoatTracker%202/${pkgver}/GoatTracker_${pkgver}.zip/download")
sha256sums=('c1b6b159ec0d37ae68599ac83be8934a71cd543e480eb5225f844b62151cea34')

build() {
	cd $srcdir/src 

	make clean
	make
}

package() {
	cd $srcdir

	mkdir -p "${pkgdir}/usr/bin/"
	install -D linux/{goattrk2,gt2reloc,ins2snd2,mod2sng,sngspli2} "${pkgdir}/usr/bin/"

	mkdir -p "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "goat_tracker_commands.pdf" "${pkgdir}/usr/share/goattracker/"
	install -d "examples" "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "readme.txt" "${pkgdir}/usr/share/goattracker/README"
}
