# Maintainer: aspen <aspenuwu@protonmail.com>
pkgname=amazon-corretto-15
pkgver=15.0.1.9.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=15' 'java-runtime=15' 'java-environment=15')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-15-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-15-amazon-corretto"
}

md5sums=('94954e91b04f4b98f4f34a4cec4520c6'
         'SKIP')
