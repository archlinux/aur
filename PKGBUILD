# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=gblocate-git
pkgver=20160407
pkgrel=1
pkgdesc="Gambas frontend to locate"
arch=('any')
license=('GPL')
url="https://github.com/kokoko3k/gbLocate"

makedepends=('gambas3-devel' 'git')

depends=( 
        'gambas3-runtime>=3.1.1'
        'gambas3-gb-form>=3.1.1'
        'gambas3-gb-qt4>=3.1.1'
        'gambas3-gb-desktop>=3.1.1'
        'gambas3-gb-image>=3.1.1'
        'gambas3-gb-settings>=3.1.1'
		'gambas3-gb-form-stock>=3.1.1'
		'gambas3-gb-desktop-x11'
		'mlocate')

_gitroot="https://github.com/kokoko3k/gbLocate.git"

build() {
  cd $srcdir

  git clone $_gitroot || return 1

  cd $srcdir/gbLocate

  gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd gbLocate

  install -d ${pkgdir}/usr/bin
  install -m755 gbLocate.gambas ${pkgdir}/usr/bin/gblocate
}

