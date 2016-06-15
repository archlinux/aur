# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=aesfix
pkgver=1.0.1
pkgrel=1
pkgdesc="Error-correction for AES key schedules"
arch=(any)
url="https://citp.princeton.edu/research/memory/"
license=('BSD')
source=("http://citpsite.s3-website-us-east-1.amazonaws.com/oldsite-htdocs/memory-content/src/aesfix-1.0.1.tar.gz")
md5sums=(f89fb82b69475bfa31f1919aaca5a58b)

build() {
	cd "$srcdir"/"$pkgname"
	make
}

package() {
	cd "$srcdir"/"$pkgname"
        install -dm755 "$pkgdir"/usr/share/"$pkgname"
        install -dm755 "$pkgdir"/usr/bin/
        install -dm755 "$pkgdir"/usr/share/licenses/"$pkgname"
        cp -rf * "$pkgdir"/usr/share/"$pkgname"/
        cp LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"
        ln -s /usr/share/"$pkgname"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
