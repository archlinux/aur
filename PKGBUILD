# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Johannes Dewender < arch at JonnyJD dot net >

pkgname=vim-vimwiki
pkgver=2023.04.04_1
pkgrel=1
pkgdesc='A personal wiki for Vim'
arch=('any')
url='https://github.com/vimwiki/vimwiki'
license=('MIT')
groups=('vim-plugins')
depends=('vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vimwiki/vimwiki/archive/v${pkgver}.tar.gz")
sha256sums=('a8dc8e94bde49343b160f876962963a9b4570b5639d4262e5fb5678f85de1de8')

package () {
  cd "${pkgname#vim-}-${pkgver}"

  install -d $pkgdir/usr/share/vim/vimfiles/autoload/vimwiki
  install -Dm644 autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/

  install -d $pkgdir/usr/share/vim/vimfiles/{doc,ftplugin,plugin,syntax}
  install -Dm644 doc/vimwiki.txt $pkgdir/usr/share/vim/vimfiles/doc/
  for x in {ftplugin,plugin,syntax}; do
    install -Dm644 $x/* $pkgdir/usr/share/vim/vimfiles/$x/
  done
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
