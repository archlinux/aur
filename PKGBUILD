# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=janet-lang-bin
pkgver=1.19.0
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet-lang')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}-v${pkgver}-linux-x64.tar.gz"
	"https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}.h")
sha256sums=('cffeddfa67512c4eb40ec6044b11105dfb6dd2a9baa8001c317cc57fb4bf8534'
            '1bcf23d0426d7fbe999f7f11bd3614e8407adaf2b9dbcf500a87ec8b5de461c2')


package() {
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/janet" "${pkgdir}/usr/bin/janet"
  install -dm777 "${pkgdir}/usr/lib/janet"
  install -dm777 "${pkgdir}/usr/lib/janet/.cache"
  install -Dm644 "${srcdir}/janet.h" "${pkgdir}/usr/include/janet.h"
}
