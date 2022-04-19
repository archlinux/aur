pkgname=amazon-corretto-18
pkgver=18.0.1.10.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=18' 'java-runtime=18' 'java-environment=18')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-18-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-18-amazon-corretto"
}

md5sums=('87d68ef4a00c5742f1dd52a1321c7335'
         'SKIP')

