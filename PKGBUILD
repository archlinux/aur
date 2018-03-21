# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=vim-rails
pkgver=5.3_25295
pkgrel=2
pkgdesc='ViM plugin for enhanced Ruby on Rails application development'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1567'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
options=('!strip')
source=("$pkgname.zip::http://www.vim.org/scripts/download_script.php?src_id=${pkgver#*_}"
        license.txt)
sha256sums=('2c17cf2f51bb86da797768a78603d208f27b1a6e0301bd9bfed30dec5ac45b57'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  local installpath="$pkgdir/usr/share/vim/vimfiles"

  install -Dm644 autoload/rails.vim "$installpath/autoload/rails.vim"
  install -Dm644 doc/rails.txt "$installpath/doc/rails.txt"
  install -Dm644 plugin/rails.vim "$installpath/plugin/rails.vim"
  install -Dm644 compiler/rails.vim "$installpath/compiler/rails.vim"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u 3 www.vim.org/scripts/script.php?script_id=1567
# vim:set ts=2 sw=2 et:
