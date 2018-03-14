# Maintainer: Mustafa Gönül <mustafagonul@gmail.com> 
pkgname=vim-wildgitignore-git
pkgver=e863d50
pkgrel=1
pkgdesc="This plugin just turns gitignore rules into vim wildignore rules."
arch=('any')
url="https://github.com/jason0x43/vim-wildgitignore"
license=('')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git') 
source=("$pkgname::git+https://github.com/jason0x43/vim-wildgitignore")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  # echo $(git describe --tags | sed 's#-#_#g;s#v##')
  echo "$(git describe --always|cut -d 'v' -f2|sed -e 's|-|.|g' )"
}

package() {
  cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/share/vim/vimfiles/plugin
  cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
}

# vim:set ts=2 sw=2 et: 
