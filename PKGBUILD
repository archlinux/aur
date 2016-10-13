# Maintainer: Joost Bremmer <toost.b@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=neovim-supertab
pkgver=2.1
pkgrel=1
pkgdesc='A Neovim plugin that allows you to use the tab key to do all insert completion.'
arch=('any')
url='https://github.com/ervandew/supertab'
license=('BSD')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("https://github.com/ervandew/supertab/archive/$pkgver.tar.gz"
        'LICENSE')
md5sums=('8c9fd74e228521f64221b91e1a54abfe'
         'a232f3fa724b2e52e1678adcc84f67bb')

package() {
  cd "$srcdir/supertab-$pkgver"

  installpath="$pkgdir/usr/share/nvim/runtime"

  install -Dm0644 doc/supertab.txt "$installpath/doc/supertab.txt"
  install -Dm0644 plugin/supertab.vim "$installpath/plugin/supertab.vim"
  install -Dm0644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
