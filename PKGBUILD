# Maintainer: Callum Parsey <neoninteger@protonmail.com>
# Contributor: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=vnu
pkgver=26.5.29
_commit=d3efb7d93855d9c12fdc7b764e81f873f6e47186
pkgrel=1
pkgdesc="The Nu Html Checker, a command line tool for HTML5 markup validation"
arch=('any')
url="https://validator.github.io/validator/"
license=('MIT' 'BSD' 'Apache' 'CDDL' 'EPL' 'MPL')
depends=('bash' 'java-runtime>=11')
conflicts=(validatornu)
replaces=(validatornu)
install=post_install.install
source=("vnu"
        "https://registry.npmjs.org/vnu-jar/-/vnu-jar-$pkgver.tgz"
        "https://raw.githubusercontent.com/validator/validator/$_commit/CREDITS")
sha256sums=('255ba98828be8e3f237f7b98b030431408b1b4096f5c956d2dbc957be7bb0b67'
            '099f20e34164042861e6925d8ed692ab50611fbb526e3672c0fcadde67ea89be'
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
