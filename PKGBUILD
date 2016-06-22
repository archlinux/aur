# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Matej Lach <matej.lach@gmail.com>

pkgname=birdfont
pkgver=2.16.4
pkgrel=1
pkgdesc='A free font editor that lets you create vector graphics and export TTF, EOT & SVG fonts'
arch=('i686' 'x86_64')
url='https://birdfont.org/'
license=('GPL3')
depends=('libgee' 'webkit2gtk' 'libnotify' 'libxmlbird')
makedepends=('vala' 'gettext' 'python')
source=(https://birdfont.org/releases/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('662bd78491f5af44fdb123ed1522e9df348482183ab45cd0735c44fac6eec7387787ab3b25e789aecb0a108b95a04e24bc5c1ee4044481554514f40dce1f4d59'
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
