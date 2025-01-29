# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=spf-tools
pkgver=2.1
pkgrel=1
pkgdesc="Scripts for taming the SPF records in order to fight 10-maximum-DNS-look-ups limit"
arch=(any)
url="https://github.com/spf-tools/spf-tools"
license=('Apache-2.0')
depends=('glibc' 'sh')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/spf-tools/spf-tools.git#tag=v"$pkgver"")
backup=('etc/postallow.conf')
sha256sums=('444dae6a7cd2a6bc30636c9afd3b6698ce2b4da068ff65c15f75ac44d831690d')

package() {
  cd "$pkgname"
  
  install -Dm755 *.sh -t "$pkgdir"/usr/bin/"$pkgname"
  install -Dm755 include/* -t "$pkgdir"/usr/bin/"$pkgname"/include

  # documentation
  install -Dm644 {README.md,AUTHORS} -t "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
