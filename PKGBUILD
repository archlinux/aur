# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-unimpaired
pkgver=2.0
pkgrel=1
pkgdesc='Pairs of handy bracket mappings for vim'
arch=('any')
url='https://github.com/tpope/vim-unimpaired'
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tpope/vim-unimpaired/archive/v${pkgver}.tar.gz")
sha512sums=('e9c7f265ac343aa5d8aaed8c922209390524c5470d0f06278bfb0fd87fb9bc39eeb802bbe314bb6e7da36166c0091389f3cf32e6480075ee3ae55525e09830a5')

package() {
  cd "${srcdir}/vim-unimpaired-${pkgver}"

  install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc}
  install -D -m644 plugin/unimpaired.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -D -m644 doc/unimpaired.txt "${pkgdir}/usr/share/vim/vimfiles/doc/"

  _licencepath="${pkgdir}/usr/share/licenses/$pkgname/"
  mkdir -p "${_licencepath}"
  sed -n '/^License/,/^$/p' doc/unimpaired.txt | sed '$d' > "${_licencepath}/LICENSE"
}
