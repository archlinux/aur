# Maintainer: Mustafa Gönül <mustafagonul@gmail.com>
pkgname=vim-bufkill-git
pkgver=0cb3672
pkgrel=2
pkgdesc="Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s)"
arch=('any')
url="https://github.com/qpkorr/vim-bufkill"
license=('')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git') 
install=vimdoc.install
source=("$pkgname::git+https://github.com/qpkorr/vim-bufkill")
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

