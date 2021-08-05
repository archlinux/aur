# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

pkgname=telepresence2
pkgver=2.4.0
pkgrel=1
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64')
license=('Apache')
url="https://github.com/telepresenceio/telepresence"
makedepends=('go' 'git' 'make')
backup=()
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('aa026ae2fe7d2ab97d473bcb3f093dc5')

package(){
  cd ${srcdir}/telepresence-${pkgver}
  TELEPRESENCE_VERSION=v${pkgver} make build
  install -Dm755 ./build-output/bin/telepresence ${pkgdir}/usr/bin/telepresence
}
