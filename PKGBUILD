# Maintainer: Callum Parsey <neoninteger@protonmail.com>
# Contributor: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=validatornu
pkgver=22.9.29
pkgrel=1
pkgdesc="The Nu Html Checker, a command line tool for HTML5 markup validation"
arch=('any')
url="https://validator.github.io/validator/"
license=('custom') # FIXME Should be expanded to MIT/dependency licenses
depends=('java-environment>=8')
source=('validatornu'
        "https://registry.npmjs.org/vnu-jar/-/vnu-jar-$pkgver.tgz")
sha256sums=('96cd47b569b8c79a60f3bea22159444919b418ef20d8beb4b223a6389aabbf25'
            '651b8183b1ffed596260b19b4e2865ff6f4711b1881fdbfe5525af4a72f7cd63')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/package/build/dist/vnu.jar" "$pkgdir/usr/share/java/$pkgname/vnu.jar"
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/package/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
