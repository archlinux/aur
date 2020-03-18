# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-sandwich-git
pkgver=r412.02e3b6d1ff
pkgrel=1
pkgdesc="Set of operator and textobject plugins to search/select/edit sandwiched textobjects"
arch=(any)
depends=(vim)
groups=(vim-plugins)
url="https://github.com/machakann/vim-sandwich"
license=(custom:vim)
source=("git+$url")
sha256sums=('SKIP')
provides=(vim-sandwich)
conflicts=(vim-sandwich)

pkgver() {
  cd vim-sandwich
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

package() {
  cd vim-sandwich
  find autoload plugin after macros doc \
    -type f \
    -exec install -D {} "$pkgdir"/usr/share/vim/vimfiles/{} \;
}
