# Maintainer: Manish Khadka <manish.khadka@ttutanota.com>

pkgname=tfk8s-bin
pkgorg=tfk8s
pkgver=0.1.10
pkgrel=1
pkgdesc="If you want to copy examples from the Kubernetes documentation or migrate existing YAML manifests and use them with Terraform without having to convert YAML to HCL by hand, this tool is for you."
arch=('any')
_vendor="github.com/jrhouston/${pkgorg}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('be2680e76311ac7dd814a1bb0dceb486e3511d8d68845421338f9fcf5a92d5f9')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/tfk8s-${pkgver}
  go build -o tfk8s
}

package() {
  install -Dm755 $srcdir/tfk8s-${pkgver}/tfk8s $pkgdir/usr/bin/tfk8s
}
