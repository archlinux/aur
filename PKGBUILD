# Maintainer: Falco Preiseni <apfelkomplott2014 at mailbox dot org>
pkgname=ende
pkgver=1.0.0
pkgrel=2
pkgdesc="An english<->german dictionary for your command line"
arch=('any')
url="https://git.codecoop.org/iceflower/ende"
license=('GPL3')
depends=('java-runtime')
makedepends=('apache-ant')
source=('https://git.codecoop.org/iceflower/ende/repository/archive.tar.bz2?ref=release'
        'http://ftp.tu-chemnitz.de/pub/Local/urz/ding/de-en/de-en.txt.bz2')
sha512sums=('f1516b8f71810b3a4f6be34c55453370ecd2c2f0a32c466fdc62dbf516af17566eb98a488374c876003eb3f4ceb3890039137511ec8bbb191b9dc6d32e5d0dd4'
            '4bd850af8dc84fcfc1d8876c902f48a76063c68bfcd1abad2dc1baba587b1adc9ee5d30bec433aee10b2e30f71ff3421adb35a2ae9002094fed29351d9275f1a')
package() {
	cd "$srcdir/ende.git/EnDe/"
	mv ../../de-en.txt ./
	ant archlinux-install
	cp -R dist/* "$pkgdir"
	chmod a+r+x "$pkgdir/usr/bin/$pkgname"
}

