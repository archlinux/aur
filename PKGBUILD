# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

pkgname=vim-vala-git
pkgver=r2.a23aa5a
pkgrel=1
pkgdesc="Support for vala and genie languages"
arch=('i686' 'x86_64')
url="https://github.com/fishman/vim-vala"
license=('unknown')
depends=('vim')
provides=('vim-vala')
conflicts=('vim-vala')
groups=('vim-plugins')
source=("$pkgname"::'git://github.com/fishman/vim-vala.git'
		ftdetect.vim)
md5sums=('SKIP'
         '2d3d99be37cc170d747d33ae86bf10b4')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  dir="$pkgdir/usr/share/vim/vimfiles"
  install -d "$dir"/ftdetect

  cd "$srcdir"
  install -m644 ftdetect.vim "$dir/ftdetect/vala.vim"

  cd "$pkgname"
  mv indent syntax "$dir"
}
