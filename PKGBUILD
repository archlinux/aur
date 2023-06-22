# Contributor: Nils Grunwald <nils [@] grunwald [dot] fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: paulsnar <paulsnar@paulsnar.lv>

_pkgname=janet
pkgname=janet-lang-bin
pkgver=1.29.1
pkgrel=1
pkgdesc='A dynamic Lisp dialect and bytecode vm'
arch=('x86_64')
url='https://janet-lang.org/'
license=('MIT')
provides=('janet-lang')
conflicts=('janet-lang' 'janet-lang-git')

source=("https://github.com/janet-lang/janet/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.gz")
sha256sums=('0448dc4a83049e9adefeaaeb0f8b14b74c161fa8010b9fea9fefee8735b05cab')

package() {
  install -Dm755 "$srcdir"/${_pkgname}-v${pkgver}-linux/bin/janet "$pkgdir"/usr/bin/janet
  install -Dm644 "$srcdir"/${_pkgname}-v${pkgver}-linux/include/janet.h "$pkgdir"/usr/include/janet.h
  install -dm777 "$pkgdir"/usr/lib/janet
  install -dm777 "$pkgdir"/usr/lib/janet/.cache
}
