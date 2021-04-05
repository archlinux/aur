# Maintainer: lmartinez-mirror
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=vim-devicons
pkgver=0.11.0
pkgrel=1
pkgdesc='Adds file type icons to Vim plugins'
arch=('any')
url='https://github.com/ryanoasis/vim-devicons'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('nerd-fonts: fonts with glyphs built-in'
            'ttf-nerd-fonts-symbols: standalone glyphs and icons')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('e6a2b7c291926177abee4f8429e742dc0b8f7090eff24fc283e6d46415d9fc4b8c095196cb80c6d583b087f7f93cff978967e6d3fb0aca74dc849aec7bdb7cde')

package() {
  cd "$pkgname-$pkgver"
  find autoload nerdtree_plugin plugin pythonx rplugin \
    -type f -exec install -Dm 755 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  find doc \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set et sw=2 ts=2 tw=79:
