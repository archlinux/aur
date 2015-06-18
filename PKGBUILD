# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=vundle
_gitname=Vundle.vim
pkgver=0.10.2
pkgrel=1
pkgdesc="Plug-in manager for Vim"
url="https://github.com/gmarik/Vundle.vim"
arch=('any')
license=('MIT')
depends=('vim>=7.0')
install=vundle.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/gmarik/Vundle.vim/archive/v${pkgver}.tar.gz
        vundle.vimrc)
sha512sums=('SKIP'
            '73329b4a1f302c684a6c203faac11ca040fd549ed4b4a5b09f4d94c53315748478e3b079bd4d2aed648e4eece2e62fd99d21ffcd34eb966e9e840ef73647c5fb')

package() {
  cd ${_gitname}-${pkgver}

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p ${vimpath}/doc
  cp -R doc ${vimpath}
  mkdir -p ${vimpath}/autoload
  cp -R autoload ${vimpath}

  install -Dm 644 "${srcdir}"/vundle.vimrc ${pkgdir}/usr/share/${pkgname}/vimrc.sample
  install -Dm 644 LICENSE-MIT.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm 644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
}

# vim: ts=2 sw=2 et:
