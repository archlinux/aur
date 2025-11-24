# Maintainer: paulsnar <paulsnar@paulsnar.lv>
# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=janet
pkgname=janet-lang-bin
pkgver=1.40.1
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.gz")
sha256sums=('675cf6cd11b5166bf69ac3748e3a073a70437c02d9c9e741ab641d5311b06ae2')

package() {
  install -Dm755 "$srcdir"/${_pkgname}-v${pkgver}-linux/bin/janet "$pkgdir"/usr/bin/janet
  install -Dm644 "$srcdir"/${_pkgname}-v${pkgver}-linux/include/janet.h "$pkgdir"/usr/include/janet.h
  install -dm777 "$pkgdir"/usr/lib/janet
  install -dm777 "$pkgdir"/usr/lib/janet/.cache
  install -Dm644 "$srcdir"/${_pkgname}-v${pkgver}-linux/man/man1/janet.1 "$pkgdir"/usr/share/man/man1/janet.1
  gzip "$pkgdir"/usr/share/man/man1/janet.1
}
