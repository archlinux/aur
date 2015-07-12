# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=0.2.0.20150430101621
pkgrel=1
pkgdesc="Lean Theorem Prover"
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
groups=('base-devel')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode' 'ninja')
conflicts=('lean-git')
source_x86_64=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_0.2.0.20150430101621.gite8d894473ed8d57cdf2616e6aa1b7df1c589a6ca~14.10_amd64.deb")
source_i386=("https://launchpad.net/~leanprover/+archive/ubuntu/lean/+files/lean_0.2.0.20150430101621.gite8d894473ed8d57cdf2616e6aa1b7df1c589a6ca~14.10_i386.deb")
md5sums_x86_64=('3318ee697f2b193d642336d3a2b79716')
md5sums_i386=('234c0cc6ea8019c61b86eb80fd7b6bd2')

package() {
  mkdir -p "$pkgname-$pkgver"
  tar xf data.tar.xz -C "$pkgname-$pkgver"
  find "$pkgname-$pkgver" -exec chmod 755 {} \;
  cp -r "$pkgname-$pkgver"/* "$pkgdir"
  ln -s /usr/lib/liblua.so "$pkgdir"/usr/lib/liblua5.2.so.0
}
