# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
pkgname=swagger-codegen
pkgver=2.2.3
pkgrel=1
pkgdesc="Swagger Code Generator"
arch=("any")
url="https://github.com/swagger-api/swagger-codegen"
license=("Apache")
groups=()
depends=('java-runtime')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://oss.sonatype.org/content/repositories/releases/io/swagger/swagger-codegen-cli/$pkgver/swagger-codegen-cli-$pkgver.jar
       swagger-codegen)
sha256sums=('3ea8eb8ef7b2f321a184ebfe344e2ac35cd7ba4b288810f7e55678566d97edc1'
            'b1c49877eaf8905f0d6d297a7a68692b5137e24df44ddf585f45033962c4e3ab')
noextract=(swagger-codegen-cli-$pkgver.jar)

package() {
  install -d -m 755 "$pkgdir/usr/share/java/swagger-codegen"
  install -m 644 swagger-codegen-cli-$pkgver.jar "$pkgdir/usr/share/java/swagger-codegen"
  ln -s "$pkgdir/usr/share/java/swagger-codegen/swagger-codegen-cli-$pkgver.jar" "$pkgdir/usr/share/java/swagger-codegen/swagger-codegen-cli.jar"
  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 swagger-codegen "$pkgdir/usr/bin"
}
