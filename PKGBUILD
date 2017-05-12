# Maintainer: Fabio Zanini <fabio.zanini _at_ tuebingen.mpg.de>
_pkgname=vim-signature
pkgname=$_pkgname-git
pkgver=1479704793
pkgrel=1
pkgdesc="Plugin to toggle, display and navigate marks for vim"
arch=('any')
license=('MIT')
groups=()
depends=('vim')
makedepends=('git')
source=("$_pkgname::git+https://github.com/kshenoy/vim-signature.git" "vim-signature.install")
md5sums=('SKIP' 'db2324de860f43a5b639d6ec9f1f87bf')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}

