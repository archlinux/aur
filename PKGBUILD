pkgname=amazon-corretto-17
pkgver=17.0.7.7.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=17' 'java-runtime=17' 'java-environment=17')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-17-amazon-corretto"
}

sha256sums=('8d23e0f1249f2852caa76b7ae8770847e005e4310a70a46b7c1a816c34ff9195'
         'SKIP')

