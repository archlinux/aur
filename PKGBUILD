# Maintainer: Grant Moyer <grantmoyer@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rpgvxace-rtp
pkgver=100
pkgrel=3
pkgdesc="RPGMaker VX Ace Runtime Package"
arch=('any')
url="https://www.rpgmakerweb.com/run-time-package"
license=('custom')
makedepends=('innoextract')
source=("http://dl.komodo.jp/rpgmakerweb/run-time-packages/RPGVXAce_RTP.zip")
sha256sums=('7e93d0ead93a686218b7c671bf099ef42f09f536083bd0b2f0fa6423a39fc19b')

prepare() {
	cd RTP100
	innoextract Setup.exe
}

package() {
	install -Dm444 "$srcdir/RTP100/ReadMe.txt" "$pkgdir/usr/share/licenses/rpgvxace-rtp/LISCENSE.txt"
	install -d "$pkgdir/opt"
	cp -r "$srcdir/RTP100/app" "$pkgdir/opt/rpgvxace-rtp"
}
