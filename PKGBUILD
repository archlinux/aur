# Maintainer: Tim Boeckstaens <boeckstaenstim+aur@gmail.com>
pkgname=amazon-corretto-16
pkgver=16.0.1.9.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=16' 'java-runtime=16' 'java-environment=16')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-16-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-16-amazon-corretto"
}

md5sums=('18a7d7483729530e7e3d9109a7e00128'
         'SKIP')

