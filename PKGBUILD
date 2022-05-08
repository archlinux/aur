# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

pkgname=telepresence2
pkgver=2.5.8
pkgrel=1
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64')
license=('Apache')
url="https://github.com/telepresenceio/telepresence"
makedepends=('go' 'git' 'make' 'jq')
backup=()
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('7969f382aa4719faf4f13edf0559d901')

package(){
  cd ${srcdir}/telepresence-${pkgver}
  TELEPRESENCE_VERSION=v${pkgver} make build-version
  install -Dm755 ./build-output/bin/telepresence ${pkgdir}/usr/bin/telepresence
}
