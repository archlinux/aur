# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=grip-git
pkgver=20120917
pkgrel=1
pkgdesc="Gambas realtime infinality previewer"
arch=('any')
license=('GPL')
url="https://github.com/kokoko3k/grip"

makedepends=('gambas3-devel' 'git')

depends=( 
        'gambas3-runtime>=3.1.1'
        'gambas3-gb-form>=3.1.1'
        'gambas3-gb-qt4>=3.1.1'
        'gambas3-gb-desktop>=3.1.1'
        'gambas3-gb-image>=3.1.1'
		'gambas3-script>=3.1.1'
		'gambas3-gb-form-stock>=3.1.1'
		'gambas3-gb-desktop-x11'
        'freetype2-infinality')

_gitroot="https://github.com/kokoko3k/grip.git"

build() {
  cd $srcdir

  git clone $_gitroot || return 1

  cd $srcdir/grip

  gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd grip

  install -d ${pkgdir}/usr/bin
  install -m755 grip.gambas ${pkgdir}/usr/bin/grip
}

