# Maintainer: Heine Otte <heinep@gmail.com>
_pkgname=velvet
pkgname=$_pkgname-git
pkgver=e899ceb
pkgrel=3
pkgdesc="Velvet is a fully scriptable terminal multiplexer which draws heavy inspiration from tmux and neovim"
arch=('x86_64')
url="https://github.com/Operdies/$_pkgname.git"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=(git gcc make)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname" || exit 1
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/$_pkgname" || exit 1
  make PREFIX="$pkgdir"/usr install
  ln -sf /usr/share/velvet/bin/vv "$pkgdir"/usr/bin/vv
}

