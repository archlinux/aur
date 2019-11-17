pkgname=jd-cmd
pkgver=1.0.0.Final
pkgrel=1
arch=('any')
depends=('java-runtime')
license=('GPL3')
url='https://github.com/kwart/jd-cmd'
source=("https://github.com/kwart/jd-cmd/releases/download/$pkgname-$pkgver/jd-cli-$pkgver-dist.tar.gz")
sha256sums=('b87ec7ca0243bab697f2806ffe4e425618860787bf6cff3daff2e44bfd4a266a')

package() {
    install -Dm644 "$srcdir/jd-cli.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -d "$pkgdir/usr/bin"
    echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
