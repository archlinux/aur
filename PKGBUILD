# Maintainer: scpketer <scpketer@krampus.pro>
pkgname=recaf
pkgver=2.4.1
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("jre11-openjdk")
noextract=("$pkgname-$pkgver.jar")
source=("https://github.com/Col-E/Recaf/releases/download/$pkgver/$pkgname-$pkgver-J8-jar-with-dependencies.jar")
sha256sums=('SKIP')

package() {
    install -Dm644 "$srcdir/$pkgname-$pkgver-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -d "$pkgdir/usr/bin"
    printf '#!/usr/bin/env bash\nexec java -jar /usr/share/java/%s/%s.jar "$@"' "$pkgname" "$pkgname" > "$pkgdir/usr/bin/$pkgname"
    chmod 775 "$pkgdir/usr/bin/$pkgname"
}
