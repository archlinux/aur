# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=amazon-corretto-8
pkgver=8.392.08.1
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

sha256sums_x86_64=('ffabf152c42d091ff16c920f0c4e267a4f13598bdbda2b32dd78a24054d97c0d'
                   'SKIP')
sha256sums_aarch64=('25f2bf6103c97cc44371d888b649449178baeaa4033d1867a3d12bc328e96cd4'
                    'SKIP')
