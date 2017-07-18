# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=vim-easymotion
pkgver=3.0.1
pkgrel=3
pkgdesc='simpler and faster vim motions'
arch=('any')
url="https://github.com/easymotion/vim-easymotion"
license=('unknown')
depends=('vim-runtime' 'vim-vital-git')
conflicts=('vim-easymotion-git')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/easymotion/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('75ff395f131d12e15cafab1e2d5301db13711d19')
sha512sums=('8d9349eb4c558cf2d86ea696e8d99f7720542e206b87e6e21073eacb79dbb89669cba24feecc54006c3f374afcc9bb8156f7eb4424df8bd00ef659c4a4df335c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"
  cp -r autoload doc plugin t "${pkgdir}/usr/share/vim/vimfiles/"
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"
}
# vim:set ts=2 sw=2 et:
