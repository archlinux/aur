pkgname=bashrc-aosc
pkgver=0.4.5.1
pkgrel=1
pkgdesc="Bash config from AOSC OS"
arch=('any')
url='https://github.com/AOSC-Dev/bash-config'
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+https://github.com/AOSC-Dev/bash-config.git")
sha256sums=('SKIP')
_gitname='bash-config'
pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644  bashrc "$pkgdir/etc/bash.bashrc"
  install -Dm644 -d bashrc.d "$pkgdir/etc/bashrc.d/"
}
