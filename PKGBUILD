# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
pkgname=swagger-codegen
pkgver=2.3.1
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
sha256sums=('428cda915b341824353f045f1714e1c7657aeb70126f52f6f4ccc4d33fc8389c'
            'b1c49877eaf8905f0d6d297a7a68692b5137e24df44ddf585f45033962c4e3ab')
noextract=(swagger-codegen-cli-$pkgver.jar)

package() {
  install -d -m 755 "$pkgdir/usr/share/java/swagger-codegen"
  install -m 644 swagger-codegen-cli-$pkgver.jar "$pkgdir/usr/share/java/swagger-codegen"
  ln -s "swagger-codegen-cli-$pkgver.jar" "$pkgdir/usr/share/java/swagger-codegen/swagger-codegen-cli.jar"
  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 swagger-codegen "$pkgdir/usr/bin"
}
