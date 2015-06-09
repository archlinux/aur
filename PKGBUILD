# Maintainer : Antonio Orefice <xt7player@gmail.com>


pkgname=gbscan-git
pkgver=20120917
pkgrel=1
pkgdesc="Gambas gui to scanimage"
arch=('any')
license=('GPL')
url="https://github.com/kokoko3k/gbscan"

makedepends=('gambas3-devel' 'git')

depends=( 
        'gambas3-runtime>=3.1.1'
        'gambas3-gb-form>=3.1.1'
        'gambas3-gb-form-dialog>=3.1.1'
        'gambas3-gb-qt4>=3.1.1'
        'gambas3-gb-qt4-ext>=3.1.1'
        'gambas3-gb-desktop>=3.1.1'
		'gambas3-gb-pdf'        
		'gambas3-gb-image-effect>=3.1.1'
		'gambas3-gb-image-imlib>=3.1.1'
		'gambas3-gb-image>=3.1.1'
		'gambas3-gb-settings>=3.1.1'
		'gambas3-gb-desktop-x11'
        'sane')


_gitroot="https://github.com/kokoko3k/gbscan"

build() {
  cd $srcdir
  rm -R $srcdir/gbscan &>/dev/null || echo "No old repository found, proceding to git clone..."
  git clone --depth 1 $_gitroot || return 1

  cd $srcdir/gbscan

  gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd gbscan
  install -d ${pkgdir}/usr/bin
  install -m755 gbscan.gambas ${pkgdir}/usr/bin/gbscan
}

