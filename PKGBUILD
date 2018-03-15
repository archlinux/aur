# Maintainer: Mustafa Gönül <mustafagonul@gmail.com>
pkgname=vim-fixkey-git
pkgver=0.3.8
pkgrel=2
pkgdesc="Fixkey helps Vim use the non-ASCII keys of a terminal emulator, permitting mapping of several classes of characters."
arch=('any')
url="https://github.com/drmikehenry/vim-fixkey"
license=('')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git') 
install=vimdoc.install
source=("$pkgname::git+https://github.com/drmikehenry/vim-fixkey")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  # echo $(git describe --tags | sed 's#-#_#g;s#v##')
  echo "$(git describe --always|cut -d 'v' -f2|sed -e 's|-|.|g' )"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc}
  cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
  cp -r doc/*.txt $pkgdir/usr/share/vim/vimfiles/doc/
}

# vim:set ts=2 sw=2 et: 

