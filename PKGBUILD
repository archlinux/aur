# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.18.6
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=('i686' 'x86_64')
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkit2gtk' 'libnotify' 'libxmlbird')
makedepends=('vala' 'gettext' 'python')
source=(https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('34a021f23a59b9a817721b064b691c1fb8da5a4aa3b269c34881701eb85a159dc5760260c8d18823c4388213c4627c41cbbf356a69243290ad0631d8205318b0'
            'SKIP')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure -p /usr
	./build.py
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./install.py -d "${pkgdir}" -n /share/man/man1 -l /lib
}
