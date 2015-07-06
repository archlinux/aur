# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=vim-ruby-git
_gitname=vim-ruby
pkgver=654.f4c550e
pkgrel=1
pkgdesc="Vim configuration files for Ruby (git version)"
arch=('any')
url="https://github.com/vim-ruby"
license=('GPL')
depends=('vim')
makedepends=('git' 'ruby')
install=vimdoc.install
source=('git://github.com/vim-ruby/vim-ruby.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  ruby bin/vim-ruby-install.rb --directory "$pkgdir/usr/share/vim/vimfiles"
}

# vim:set ts=2 sw=2 et:
