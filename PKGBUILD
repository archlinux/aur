# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-startuptime-git
pkgver=2.0.2.r3.gc622725
pkgrel=1
pkgdesc="Vim plugin for profiling Vim's startup time"
arch=('any')
url="https://github.com/dstein64/vim-startuptime"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  install -Dvm 644 autoload/startuptime.vim -t "$pkgdir/usr/share/vim/vimfiles/autoload/"
  install -Dvm 644 doc/startuptime.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
  install -Dvm 644 plugin/startuptime.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
