# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
pkgname=swagger-codegen-2
pkgver=2.4.7
pkgrel=1
pkgdesc="Swagger Code Generator (2.x series)"
arch=("any")
url="https://github.com/swagger-api/swagger-codegen"
license=("Apache")
groups=()
depends=('java-runtime')
makedepends=()
provides=()
conflicts=('swagger-codegen')
replaces=('swagger-codegen')
backup=()
options=()
install=
source=(https://oss.sonatype.org/content/repositories/releases/io/swagger/swagger-codegen-cli/$pkgver/swagger-codegen-cli-$pkgver.jar
       swagger-codegen)
sha256sums=('eadc0af727822cb3c55df3d81e77852ab8e711ac18c658c527265bc3da8946b4'
            'b1c49877eaf8905f0d6d297a7a68692b5137e24df44ddf585f45033962c4e3ab')
noextract=(swagger-codegen-cli-$pkgver.jar)

package() {
  install -d -m 755 "$pkgdir/usr/share/java/swagger-codegen"
  install -m 644 swagger-codegen-cli-$pkgver.jar "$pkgdir/usr/share/java/swagger-codegen"
  ln -s "swagger-codegen-cli-$pkgver.jar" "$pkgdir/usr/share/java/swagger-codegen/swagger-codegen-cli.jar"
  install -d -m 755 "$pkgdir/usr/bin"
  install -m 755 swagger-codegen "$pkgdir/usr/bin"
}
