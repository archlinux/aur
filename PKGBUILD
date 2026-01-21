# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: ThecaTTony <thecattony at gmx dot com>
pkgname=crunch
pkgver=3.6
pkgrel=2
pkgdesc="A wordlist generator that uses standard or custom character sets"
arch=(x86_64)
url=http://sourceforge.net/projects/crunch-wordlist/
license=(GPL-2.0-only)
source=($pkgname-$pkgver.tar.gz::http://downloads.sourceforge.net/project/crunch-wordlist/crunch-wordlist/$pkgname-$pkgver.tgz)
b2sums=('987fc0fddbc9330c2f196b5914c535e3c81a0cbd30bd2121d05ccb937c9ba9f3f9296dd20a638efad8219cc5555203dc8b75b2fa6aa3e497a3da665b4c51fbeb')

build() {
    cd $pkgname-$pkgver
    PREFIX=/usr make
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 crunch "$pkgdir"/usr/bin/crunch
    install -Dm644 charset.lst "$pkgdir"/usr/share/crunch/charset.lst
    install -Dm644 crunch.1 "$pkgdir"/usr/share/man/man1/crunch.1
}
