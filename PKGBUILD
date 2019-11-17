# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=pandoc-manpage
pkgver=2.7.3
pkgrel=1
pkgdesc="A temporary solution for getting the manpage while the missing manpage bug persists in the official package"
arch=('any')
url="https://pandoc.org"
license=('GPL2')
source=("https://raw.githubusercontent.com/jgm/pandoc/$pkgver/man/pandoc.1")
md5sums=('c0f56df3283f8ec8b8caf166125c50e0')

build() {
    cd "$srcdir/"
    cat "pandoc.1" | gzip > "pandoc.1.gz"
}

package() {
    install -Dm 644 "$srcdir/pandoc.1.gz" "$pkgdir/usr/share/man/man1/pandoc.1.gz"
}
