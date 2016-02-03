# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=neovim-remote
pkgver=v1.1.r13.g06d9297
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('GPL')
depends=('python-neovim')
source=("git+https://github.com/mhinz/neovim-remote.git#commit=06d9297d3e0118dae35ceb6a011b656cfc855ede")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 nvr "$pkgdir/usr/bin/nvr"
}

# vim:set ts=2 sw=2 et:
