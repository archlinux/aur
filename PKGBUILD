# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=0.2.0.20151014023327
pkgrel=1
pkgdesc="Lean Theorem Prover"
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
groups=('base-devel')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode' 'ninja')
conflicts=('lean-git')
source_x86_64=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_0.2.0.20151014023327.gitd508ceccecf8504257b538de57d3c76ad1e20b35~15.04_amd64.deb")
source_i386=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_0.2.0.20151014023327.gitd508ceccecf8504257b538de57d3c76ad1e20b35~15.04_i386.deb")
md5sums_x86_64=('cf31bfe90ba23e50b8da7b6053188934')
md5sums_i386=('5fc57a3ad819d2b694c0f0a3048dafaa')

package() {
  mkdir -p "$pkgname-$pkgver"
  tar xf data.tar.xz -C "$pkgname-$pkgver"
  find "$pkgname-$pkgver" -exec chmod 755 {} \;
  cp -r "$pkgname-$pkgver"/* "$pkgdir"
  ln -s /usr/lib/liblua.so "$pkgdir"/usr/lib/liblua5.2.so.0
}
