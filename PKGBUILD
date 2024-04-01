pkgname=amazon-corretto-22-bin
pkgver=22.0.0.37.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=22' 'java-runtime=22' 'java-environment=22')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-22-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-22-amazon-corretto"
}

sha256sums=('5539f405d8b6201639b23c1125482a9cc29e7367ca3c6c31a44eb65110f7939e'
        'SKIP')


