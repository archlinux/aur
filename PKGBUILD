# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>

pkgname=vim-easymotion
pkgver=3.0.1
pkgrel=5
pkgdesc='Vim motion on speed'
url='https://github.com/easymotion/vim-easymotion'
arch=('any')
license=('MIT')
depends=('vim' 'vim-vital')
groups=('vim-plugins')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/easymotion/vim-easymotion/archive/v${pkgver}.tar.gz)
sha256sums=('c1b24de4592212f4c45327b98cca521cd811074475f8352cb2231be8fc61ae44')
sha512sums=('8d9349eb4c558cf2d86ea696e8d99f7720542e206b87e6e21073eacb79dbb89669cba24feecc54006c3f374afcc9bb8156f7eb4424df8bd00ef659c4a4df335c')

package() {
  cd ${pkgname}-${pkgver}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r -t "${_installpath}" autoload doc plugin t
  rm -f "${_installpath}/autoload/vital.vim"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
