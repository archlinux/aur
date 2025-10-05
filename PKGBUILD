# Maintainer: zoeyrae
# Contributor: zoeyrae <zoey.ronain at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=amazon-corretto-25-bin
pkgver=25.0.0.36.2
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=25' 'java-runtime=25' 'java-environment=25')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-25-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-25-amazon-corretto"
}

sha256sums=('7fa3a845e2a2197d01d875889597d4196e3da310c85a4687d4214a4161cdccd0'
            'SKIP')
# vim:set ts=2 sw=2 et:


