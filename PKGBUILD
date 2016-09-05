# Maintainer: James An <james@jamesan.ca>

pkgname=jsonix-schema-compiler
pkgver=2.3.9
pkgrel=1
pkgdesc="Compiles XML Schemas into XML<->JSON mappings for Jsonix."
arch=('any')
url="https://github.com/highsource/$pkgname"
license=('BSD')
depends=('java-runtime')
source=("$url/releases/download/$pkgver/$pkgname-full-$pkgver.jar"
        "$url/raw/$pkgver/LICENSE"
        "$pkgname.sh")
noextract=("${source[0]##*/}")
md5sums=('d39494df9c0626c53eea7d18dd040af7'
         '5ce6a47a9e9e030bba86c43efec26316'
         '4b2a4cc81046d1f816e34d9887e23e35')

package() {
    install -D -m644 "$pkgname-full-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname-full-$pkgver.jar"
    install -D -m755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
