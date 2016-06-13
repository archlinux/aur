# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=goofile
pkgver=1.5
pkgrel=1
pkgdesc="A tool to search for a specific file type in a given domain"
arch=(any)
url="https://code.google.com/archive/p/goofile/"
license=('MIT')
depends=(python2)
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/goofile/goofilev1.5.zip")
md5sums=(a32a5884501d289e633fe9103d6046da)

prepare() {
        export v=v
	cd "$pkgname"$v$pkgver"
        sed -i '1c\#!/usr/bin/env python2' "$pkgname".py
}

package() {
	install -dm755 "$pkgdir"/usr/share/$pkgname
        install -dm755 "$pkgdir"/usr/bin
	cp "$srcdir"/"$pkgname$v$pkgver"/"$pkgname".py "$pkgdir"/usr/share/"$pkgname"/
        chmod +x "$pkgdir"/usr/share/"$pkgname"/"$pkgname".py
        ln -s /usr/share/$pkgname/"$pkgname".py "$pkgdir"/usr/bin/"$pkgname"
}
