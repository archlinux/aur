pkgname=amazon-corretto-20-bin
pkgver=20.0.2.10.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=20' 'java-runtime=20' 'java-environment=20')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-20-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-20-amazon-corretto"
}

sha256sums=('3b60fe04966d0aa762bf1fc2974ad239cf7ab887a657a9e7e3c75a9310e34db2'
	    'SKIP')

