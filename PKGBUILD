# Maintainer: Itz-Agasta <https://github.com/Itz-Agasta>
pkgname=hopbox-bin
_pkgname=hopbox
pkgver=1.0.0
pkgrel=1
pkgdesc='Run heavy builds and tests on another machine over SSH, from your laptop or your coding agent'
arch=('x86_64' 'aarch64')
url='https://github.com/Itz-Agasta/hopbox'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'git' 'glibc' 'openssh' 'rsync')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('58e9081c2daf0761783d9e306aa7c042ef0bbd4d15bb1ded5529879353bebf78')
sha256sums_aarch64=('0745cb1fa5895efdac4c604f9e668aad93b595b2102e1f993d43f41f5db17f5c')

package() {
  cd "$_pkgname-$CARCH-unknown-linux-gnu"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
