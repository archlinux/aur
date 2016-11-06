# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.17.1
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=('i686' 'x86_64')
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkit2gtk' 'libnotify' 'libxmlbird')
makedepends=('vala' 'gettext' 'python')
source=(https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('9a311fe1e3f3b0a44cde1d1c7612b16926974f34bbdd4cdcd5e734b0ec62103e94ad10ee92b191e1009495c25225a8efff8da3e673e07ee8873fe3c0a7927816'
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
