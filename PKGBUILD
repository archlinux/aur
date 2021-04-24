# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=amazon-corretto-8
pkgver=8.292.10.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=8' 'java-runtime=8' 'java-environment=8')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-8-amazon-corretto"
}

md5sums=('9d711fdeb9176a96bae0ba276f3f3695'
         'SKIP')
