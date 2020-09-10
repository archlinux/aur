# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/master/govc"
license=('Apache')
source=(
	"https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_linux_amd64.gz"
	"https://github.com/vmware/govmomi/archive/v$pkgver.tar.gz"
)
sha1sums=('ba777988af807e4a9aaea47339125f15cdbc8eea'
          'bf0d3ed014f2056bd7408b7b79015d01eea85655')

package() {
  cd "$srcdir"

  gzip -kfd govc_linux_amd64.gz
  install -Dm755 govc_linux_amd64 "$pkgdir/usr/bin/govc"
  install -Dm644 "govmomi-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
