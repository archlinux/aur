# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=vim-rails
pkgver=5.4_25852
pkgrel=1
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
        install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
        for dir in autoload/ compiler/ doc/ plugin/; do
                cp --recursive "${dir}" "$vimdir/"
        done
}
