pkgname=amazon-corretto-21-bin
pkgver=21.0.2.13.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=21' 'java-runtime=21' 'java-environment=21')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-21-amazon-corretto"
}

sha256sums=('667202bf873ea6f5b5a4f2ef097a83ab978941b974e6d77be2ddc95f1b786f36'
        'SKIP')


