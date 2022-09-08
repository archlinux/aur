# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

pkgname=telepresence2
pkgver=2.7.3
pkgrel=1
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64')
license=('Apache')
url="https://github.com/telepresenceio/telepresence"
makedepends=('go' 'git' 'make' 'jq')
backup=()
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c80dec5290795d40f9d96b46524e1230')

package(){
  cd ${srcdir}/telepresence-${pkgver}
  TELEPRESENCE_VERSION=v${pkgver} make build
  install -Dm755 ./build-output/bin/telepresence ${pkgdir}/usr/bin/telepresence
}
