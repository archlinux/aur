# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=0.2.0.20160412023438
_gitcommit=4eee26eaee55b8e2cb6731c0499d520daf91d38c
pkgrel=3
pkgdesc="Lean Theorem Prover"
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode')
conflicts=('lean-git')
source_x86_64=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_${pkgver}.git${_gitcommit}~15.10_amd64.deb")
source_i386=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_${pkgver}.git${_gitcommit}~15.10_i386.deb")
sha1sums_x86_64=('8cdea07428cd632234894e99ba43c1e33174b385')
sha1sums_i386=('6929fadb6e2e791521cade3a476975851031e2ce')

package() {
  mkdir -p "$pkgname-$pkgver"
  tar xf data.tar.xz -C "$pkgname-$pkgver"
  find "$pkgname-$pkgver" -exec chmod 755 {} \;
  cp -r "$pkgname-$pkgver"/* "$pkgdir"
  ln -s /usr/lib/liblua.so "$pkgdir"/usr/lib/liblua5.2.so.0
}
