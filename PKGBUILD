# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=amazon-corretto-8
pkgver=8.442.06.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64' 'aarch64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=8' 'java-runtime=8' 'java-environment=8')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
source_x86_64=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
source_aarch64=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-aarch64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  case "$CARCH" in
    "x86_64")
      cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-8-amazon-corretto"
      ;;
    "aarch64")
      cp -a "amazon-corretto-$pkgver-linux-aarch64" "$pkgdir/usr/lib/jvm/java-8-amazon-corretto"
      ;;
  esac
}

sha256sums_x86_64=('a21bce3704d96a6577f4aef3b34697e25a2c0efdd39ab49df41f75bf56f775f2'
                   'SKIP')
sha256sums_aarch64=('cc69cd742377ff6693cc87366739c5adef02ea64133b5e4c6e8dadf6fb509a44'
                    'SKIP')
