# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=janet-lang-bin
pkgver=1.17.2
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}-v${pkgver}-linux-x64.tar.gz" "https://github.com/janet-lang/janet/releases/download/v${pkgver}/${pkgname/\-lang-bin/}.h")

sha256sums=('8a39bae7dd01183df8b216aee8ec469c5ea463f6cc36f28cc9dc66279828f226'
            'af215b80d4591920167690c1e8bda92b6ac5fd20a20393790098ceee8cc1a1e5')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/janet" "${pkgdir}/usr/bin/janet"
  install -Dm755 "${srcdir}/${pkgname/\-lang-bin/}-v${pkgver}-linux/bin/jpm" "${pkgdir}/usr/bin/jpm"
  install -dm777 "${pkgdir}/usr/local/lib/janet"
  install -dm777 "${pkgdir}/usr/local/lib/janet/.cache"
  install -Dm644 "${srcdir}/janet.h" "${pkgdir}/usr/include/janet.h"
}
