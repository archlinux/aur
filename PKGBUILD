# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor:  <tigersoldi at gmail dot com>
pkgname=google-java-format
pkgver=1.10.0
pkgrel=1
pkgdesc="Reformats Java source code to comply with Google Java Style"
arch=('any')
url="https://github.com/google/google-java-format"
license=('Apache')
depends=('java-runtime' 'sh')
options=()
source=(https://github.com/google/google-java-format/releases/download/v$pkgver/$pkgname-$pkgver-all-deps.jar
        google-java-format
        https://raw.githubusercontent.com/google/google-java-format/master/LICENSE)
sha256sums=('9d404cf6fe5f6aa7672693a3301ef2a22016ba540eca5d835be43104b71eb5d6'
            'fffd67f769a658dc33761f264ea6ac239200f028be2a0ab45739c83788e3fd57'
            '2c7e23c8000fe553b6f380b5e365dd72198439174f1b6821d5e3b190b54af0dc')


package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755  "$srcdir/google-java-format" "$pkgdir/usr/bin/google-java-format"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
