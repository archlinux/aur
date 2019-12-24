# Maintainer: Kaare Jenssen <kaare at jenssen dot it>
# Contributor: Aaron France <aaron.l.france@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: veox <cy at wre dot ath dot cx>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
# Contributor: Aaron France <aaron.l.france@gmail.com>

pkgname=cl-ppcre
pkgver=2.1.1
pkgrel=1
pkgdesc="Perl-compatible, portable regexp library for Common Lisp"
arch=('i686' 'x86_64')
url="http://www.weitz.de/cl-ppcre/"
license=('BSD')
depends=('common-lisp' 'cl-asdf')
install=cl-ppcre.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/edicl/cl-ppcre/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('89631179b71648d9e6c565a928f6896a9d5742aa2083b9c1b705fe0b45d85def'
            '47da9448a5379928cd3a56d327d7de89db1c2444498f5e5fa4878834c2538bb7')

package() {
    install -d "$pkgdir"/usr/share/common-lisp/source/${pkgname}
    install -d "$pkgdir"/usr/share/common-lisp/systems
    install -d "$pkgdir"/usr/share/licenses/${pkgname}

    cd $pkgname-$pkgver

    install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/$pkgname \
        "$srcdir"/$pkgname-$pkgver/*.lisp
    install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/$pkgname \
        "$srcdir"/$pkgname-$pkgver/*.asd
    install -m 644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname

    cd "$pkgdir"/usr/share/common-lisp/systems
    ln -s ../source/$pkgname/$pkgname.asd .
    ln -s ../source/$pkgname/$pkgname-unicode.asd .
}

