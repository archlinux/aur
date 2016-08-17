# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=0.2.0.20160710023446
_gitcommit=cc70845332e63a1f1be21dc1f96d17269fc85909
pkgrel=1
pkgdesc="Lean Theorem Prover"
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode')
conflicts=('lean-git')
source_x86_64=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_${pkgver}.git${_gitcommit}~15.10_amd64.deb")
source_i386=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_${pkgver}.git${_gitcommit}~15.10_i386.deb")
sha1sums_x86_64=('dfa04a4f1a7463b33d67a59c30dd03d1f4a1c1f8')
sha1sums_i386=('04528f7911f28fe40de43bf4fc436eb14c9cb29f')

package() {
  mkdir -p "$pkgname-$pkgver"
  tar xf data.tar.xz -C "$pkgname-$pkgver"
  find "$pkgname-$pkgver" -exec chmod 755 {} \;
  cp -r "$pkgname-$pkgver"/* "$pkgdir"
  ln -s /usr/lib/liblua.so "$pkgdir"/usr/lib/liblua5.2.so.0
}
