# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=0.2.0.20160314023434
pkgrel=1
pkgdesc="Lean Theorem Prover"
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode' 'ninja')
conflicts=('lean-git')
source_x86_64=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_0.2.0.20160314023434.gita8db8bc61a0b00379b3d0be8ecaf0d0858dc82ee~15.04_amd64.deb")
source_i386=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_0.2.0.20160314023434.gita8db8bc61a0b00379b3d0be8ecaf0d0858dc82ee~15.04_i386.deb")
md5sums_x86_64=('5496d564329068290a04dd59bf5e36ef')
md5sums_i386=('d75b068785c844789e2ff855827da3fa')

package() {
  mkdir -p "$pkgname-$pkgver"
  tar xf data.tar.xz -C "$pkgname-$pkgver"
  find "$pkgname-$pkgver" -exec chmod 755 {} \;
  cp -r "$pkgname-$pkgver"/* "$pkgdir"
  ln -s /usr/lib/liblua.so "$pkgdir"/usr/lib/liblua5.2.so.0
}
