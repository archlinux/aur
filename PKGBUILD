# Maintainer: Callum Parsey <neoninteger@protonmail.com>
# Contributor: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=validatornu
pkgver=25.12.8
_commit=f6c2fe281d0f9ee7066d5eef4a9b499c505476d8
pkgrel=1
pkgdesc="The Nu Html Checker, a command line tool for HTML5 markup validation"
arch=('any')
url="https://validator.github.io/validator/"
license=('MIT' 'BSD' 'Apache' 'CDDL' 'EPL' 'MPL')
depends=('bash' 'java-runtime>=11')
source=("validatornu"
        "https://registry.npmjs.org/vnu-jar/-/vnu-jar-$pkgver.tgz"
        "https://raw.githubusercontent.com/validator/validator/$_commit/CREDITS")
sha256sums=('96cd47b569b8c79a60f3bea22159444919b418ef20d8beb4b223a6389aabbf25'
            'a8f65118e780f11e343d848225c9108eff4f23a2603c3d23c1c30fda47560f18'
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
