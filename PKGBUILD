# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=vim-minibufexpl
pkgver=6.5.2
pkgrel=3
pkgdesc="An elegant buffer explorer for vim"
arch=('any')
url="http://fholgado.com/minibufexpl"
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fholgado/minibufexpl.vim/archive/v${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('325fb58b025392c5484574c4988ec95eb7374a10b67a4abe28857a0ae8d768316ef4d477b51bf442ffc1bcfb5f68dfd0c924731291b155192731055fed3569d1'
            '12c8ea4338901bfd174cf9154850d683ed24656627f28423692ebd64ea79e0949bf4aef3778cf61deca4f7a2159f56872e86d6e4c9c404264c4da94e4770d588')

package() {
  cd ${srcdir}/minibufexpl.vim-${pkgver}
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -D -m644 plugin/minibufexpl.vim $installpath/plugin/minibufexpl.vim
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
