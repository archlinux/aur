# Maintainer: Drew Noel <drewmnoel@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.28.0
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=('i686' 'x86_64')
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkit2gtk' 'libnotify' 'libxmlbird')
makedepends=('vala' 'gettext' 'python')
source=(https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('2ec9debb79245e02ba7820c75c6eac42b3968ad744db17bae2f9bfe14d7d47cccf3fa834612814be3ce809601b370dc65b68f060781ec6517fa59e358b606193'
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
