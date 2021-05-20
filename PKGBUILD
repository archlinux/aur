# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tfk8s
pkgver=0.1.3
pkgrel=1
pkgdesc="If you want to copy examples from the Kubernetes documentation or migrate existing YAML manifests and use them with Terraform without having to convert YAML to HCL by hand, this tool is for you."
arch=('any')
_vendor="github.com/jrhouston/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('0dfb441441ab270e745e31830918efab2e51d38e9535c3293d797bf90c944822')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/tfk8s-${pkgver}
  go build -o tfk8s
}

package() {
  install -Dm755 $srcdir/tfk8s-${pkgver}/tfk8s $pkgdir/usr/bin/tfk8s
}
