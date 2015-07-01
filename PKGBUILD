# Maintainer: XZS <d dot f dot fischer at web dot de>

pkgname=vim-autoswap-git
pkgver=0.3
pkgrel=1
pkgdesc="Please Vim, stop with these swap file messages. Just switch to the correct window!"
arch=('any')
url="https://github.com/gioele/vim-autoswap"
license=('custom')
groups=('vim-plugins')
depends=('wmctrl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
}

package() {
  cd "$pkgname"
  install -Dm 644 plugin/autoswap.vim "$pkgdir/usr/share/vim/vimfiles/plugin/autoswap.vim"
  install -Dm 644 COPYING.CC0 "$pkgdir/usr/share/licenses/$pkgname/COPYING.CC0"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
