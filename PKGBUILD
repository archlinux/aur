# Maintainer: minus <minus@mnus.de>

pkgname=vmware-govc-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="VMWare vSphere CLI"
arch=('x86_64')
url="https://github.com/vmware/govmomi/tree/master/govc"
license=('Apache')
source=(
	"https://github.com/vmware/govmomi/releases/download/v$pkgver/govc_linux_amd64.gz"
	"https://github.com/vmware/govmomi/archive/v$pkgver.tar.gz"
)
sha1sums=('cf1d86442e15d1677576b8b748d508427d43f915'
          '12393ead29cbc448c425a3d901fb432d97bcab61')

package() {
  cd "$srcdir"

  gzip -kfd govc_linux_amd64.gz
  install -Dm755 govc_linux_amd64 "$pkgdir/usr/bin/govc"
  install -Dm644 "govmomi-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
