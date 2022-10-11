# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: paulsnar <paulsnar@paulsnar.lv>

_pkgname=janet
pkgname=janet-lang-bin
pkgver=1.25.0
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet-lang')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.gz")
sha256sums=('bf3301e5cc32fb818d22101b14105f17b94a06b7ced168d5a5928d823a0c4790')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-linux/bin/janet" "${pkgdir}/usr/bin/janet"
  install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux/include/janet.h" "${pkgdir}/usr/include/janet.h"
  install -dm777 "${pkgdir}/usr/lib/janet"
  install -dm777 "${pkgdir}/usr/lib/janet/.cache"
}
