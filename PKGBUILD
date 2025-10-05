# Maintainer: zoeyrae
# Contributor: zoeyrae <zoey.ronain at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=amazon-corretto-24-bin
pkgver=24.0.2.12.1
pkgrel=1
pkgdesc='No-cost, multiplatform, production-ready distribution of OpenJDK'
arch=('x86_64')
url='https://aws.amazon.com/corretto/'
license=('GPL2')
depends=('java-runtime-common' 'java-environment-common')
provides=('java-runtime-headless=24' 'java-runtime=24' 'java-environment=24')
backup=()
options=()
# https://docs.aws.amazon.com/corretto/latest/corretto-24-ug/downloads-list.html
source=("https://corretto.aws/downloads/resources/${pkgver}/amazon-corretto-${pkgver}-linux-x64.tar.gz"{,.sig})
validpgpkeys=('6DC3636DAE534049C8B94623A122542AB04F24E3') # Amazon Services LLC (Amazon Corretto release) <corretto-team@amazon.com>

package() {
  mkdir -p "$pkgdir/usr/lib/jvm"
  cp -a "amazon-corretto-$pkgver-linux-x64" "$pkgdir/usr/lib/jvm/java-24-amazon-corretto"
}

sha256sums=('d4cd1f03a8b9aad58d0fdac96d1ba5de6b7ac86f3069729535f2fc1e5a33f7c6'
            'SKIP')
# vim:set ts=2 sw=2 et:

