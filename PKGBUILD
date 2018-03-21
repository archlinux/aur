# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=vim-rails
pkgver=5.4_25852
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
sha256sums=('4c8f47d76bf6ca432b46a73e29f2e47e053d25a30fd2a4b32f769a77f408c462'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
        install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

        local vimdir="$pkgdir/usr/share/vim/vimfiles"
        install --directory "$vimdir"
        for dir in autoload/ compiler/ doc/ plugin/; do
                cp --recursive "${dir}" "$vimdir/"
        done
}
