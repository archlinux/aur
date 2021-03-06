# Maintainer: lmartinez-mirror
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
pkgname=vim-a-git
pkgver=2.18.r88.gdca99f8
pkgrel=1
pkgdesc="vim plugin for switching between header and source files quickly"
arch=('any')
# Uses nacitar's fork, which incorporates several bug fixes and pull requests
url="https://github.com/nacitar/a.vim"
license=('custom')
depends=('vim-plugin-runtime')
makedepends=('git')
groups=('vim-plugins')
provides=('vim-a')
conflicts=('vim-a' 'neovim-a')
source=("$pkgname::git+$url"
         "LICENSE")
sha256sums=('SKIP'
           'fa5cd5adcfc6a34910fc9f580b7d9a31b1c7ff958268c24f58fb0e9664c60246')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  install -Dm 644 plugin/a.vim "$pkgdir/usr/share/vim/vimfiles/plugin/a.vim"
  install -Dm 644 doc/alternate.txt "$pkgdir/usr/share/vim/vimfiles/doc/alternate.txt"
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
