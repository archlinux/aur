# Maintainer: Callum Parsey <neoninteger@protonmail.com>
# Contributor: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=validatornu
pkgver=24.10.17
pkgrel=1
pkgdesc="The Nu Html Checker, a command line tool for HTML5 markup validation"
arch=('any')
url="https://validator.github.io/validator/"
license=('MIT' 'BSD' 'Apache' 'CDDL' 'EPL' 'MPL')
depends=('bash' 'java-environment>=8')
source=("validatornu"
        "https://registry.npmjs.org/vnu-jar/-/vnu-jar-$pkgver.tgz"
        "https://raw.githubusercontent.com/validator/validator/$pkgver/CREDITS")
sha256sums=('96cd47b569b8c79a60f3bea22159444919b418ef20d8beb4b223a6389aabbf25'
            '4617d3e3234a40efce2eb42fa9c0fcc8abf85c33fffb8825bfd77563209d43b0'
            'b7f78e603da0e9aa19adb63a3c12af5c8c16e40c43ac115a017cc7ed2517e9fb')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 CREDITS "$pkgdir/usr/share/licenses/$pkgname/CREDITS"

  cd package
  install -Dm644 build/dist/vnu.jar "$pkgdir/usr/share/java/$pkgname/vnu.jar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
