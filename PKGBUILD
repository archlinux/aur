# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=vim-colors-pencil-git
pkgver=1.0.r13.gfcbdca1
pkgrel=1
pkgdesc="Light & dark colorscheme inspired by iA Writer"
arch=('any')
url="https://github.com/preservim/vim-colors-pencil"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-airline')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	install -Dvm 644 colors/pencil.vim "$pkgdir/usr/share/vim/vimfiles/colors/pencil.vim"
	install -Dvm 644 autoload/airline/themes/pencil.vim "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/pencil.vim"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

