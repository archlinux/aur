# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=spf-tools
pkgver=2.3
pkgrel=1
_commit=0e6fcd2
pkgdesc="Scripts for taming the SPF records in order to fight 10-maximum-DNS-look-ups limit"
arch=(any)
url="https://github.com/spf-tools/spf-tools"
license=('Apache-2.0')
depends=('glibc' 'sh')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/spf-tools/spf-tools.git#tag=v${pkgver}")
b2sums=('22ab4c8a107701889f3c94ee8868f4f355056a69890b01a682b8b42d9f2fa92283cc8267a0383f9237a188d44731183945f82ad5bf94d9850c6cbb868abee428')

package() {
  cd "$pkgname"
  
  install -Dm755 *.sh -t "$pkgdir"/usr/bin
  install -Dm755 include/* -t "$pkgdir"/usr/include

  # documentation
  install -Dm644 {README.md,AUTHORS} -t "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
