# Maintainer : Kyle Keen <keenerd@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=memconf
pkgver=3.16
pkgrel=1
pkgdesc="Identify sizes of installed memory modules."
arch=('any')
url="https://www.4schmidts.com/memconf.html"
license=('GPL')
depends=('dmidecode' 'perl')
source=("$pkgname-$pkgver.gz::https://www.4schmidts.com/unix/$pkgname.gz"
        "$pkgname-$pkgver.man::https://www.4schmidts.com/unix/$pkgname.man")
sha256sums=('c58758cc84eca54cba90ec6171e3185f31edd28827d18c624bd65bfcb4ed8498'
            '7e79e41ac719e6ebd7669967965d47a07692a5924c2a249b0d32fc5f6ee0a2fe')

build() {
    cd "$srcdir"
    zcat "$pkgname-$pkgver.gz" > "$pkgname"
}

package() {
    cd "$srcdir"
    install -Dm0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0755 "$pkgname-$pkgver.man" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
