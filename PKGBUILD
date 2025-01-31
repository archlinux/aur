# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-unimpaired
pkgver=2.1
pkgrel=1
pkgdesc='Pairs of handy bracket mappings for vim'
arch=('any')
url='https://github.com/tpope/vim-unimpaired'
license=('custom')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tpope/vim-unimpaired/archive/v${pkgver}.tar.gz")
sha512sums=('6f26d439e940d3e39901a980e78597634cb3a89188cde8fd5091998d635fc2aa0c8c72c9ddcc4d5ab362efc7e8f819c03f81c4fc954193e177528712c168a01d')

package() {
  cd "${srcdir}/vim-unimpaired-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc}
  install -D -m644 plugin/unimpaired.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/unimpaired.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"

  _licencepath="${pkgdir}/usr/share/licenses/$pkgname/"
  mkdir -p "${_licencepath}"
  sed -n '/^License/,/^$/p' doc/unimpaired.txt | sed '$d' > "${_licencepath}/LICENSE"
}
