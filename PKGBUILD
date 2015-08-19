pkgname=jd-cmd
pkgver=0.9.1.Final
pkgrel=1
arch=('any')
depends=('java-runtime')
license=('GPL3')
url='https://github.com/kwart/jd-cmd'
source=("https://github.com/kwart/jd-cmd/releases/download/$pkgname-$pkgver/jd-cli-$pkgver-dist.tar.gz")
sha256sums=('959bde5ba8d41009dae4c3690ca172697c9c9525eccd21e51a940fa3f13f525f')

package() {
    install -Dm644 "$srcdir/jd-cli.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -d "$pkgdir/usr/bin"
    echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
