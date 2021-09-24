# Maintainer: pavel.finkelshtein@gmail.com <asm0dey>
pkgname=jooby-cli
pkgver=2.11.0
pkgrel=2
pkgdesc="CLI for jooby"
arch=("any")
url="https://jooby.io"
license=("Apache")
depends=("java-runtime-common")
source=("$pkgname-$pkgver.zip::https://repo1.maven.org/maven2/io/jooby/jooby-cli/2.11.0/jooby-cli-2.11.0.zip")
sha256sums=('065e0fe8eec48067f3263f36703edc9249e900319cc73f1534fabbc015e826fd')


package() {
    install -Dm 755 "$srcdir/bin/jooby" "$pkgdir/opt/jooby-cli/bin/jooby"
    install -D "$srcdir/lib/$pkgname-$pkgver.jar" "$pkgdir/opt/jooby-cli/lib/$pkgname-$pkgver.jar"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/jooby-cli/bin/jooby "$pkgdir/usr/bin/jooby"
}

