# Maintainer : Antonio Orefice <xt7player@gmail.com>

pkgname=higgins-git
pkgver=20210727
pkgrel=1
pkgdesc="Gambas apps launcher"
arch=('any')
license=('GPL')
url="https://github.com/kokoko3k/higgins"

makedepends=('gambas3-dev-tools' 'git')

depends=( 
		'schedtool'
        'gambas3-runtime>=3.1.1'
        'gambas3-gb-form>=3.1.1'
        'gambas3-gb-qt5>=3.1.1'
        'gambas3-gb-desktop>=3.1.1'
        'gambas3-gb-image>=3.1.1'
        'gambas3-gb-settings>=3.1.1'
		'gambas3-gb-form-stock>=3.1.1'
		'gambas3-gb-desktop-x11'
		'gambas3-gb-web'
		'gambas3-gb-net'
		'gambas3-gb-util'
		'gambas3-gb-dbus'
		'gambas3-gb-image'
		'gambas3-gb-args'
		'gambas3-gb-image-effect'
		'gambas3-gb-util-web'
		'xbindkeys')

_gitroot="https://github.com/kokoko3k/higgins.git"

build() {
  cd $srcdir

  git clone $_gitroot || return 1

  cd $srcdir/higgins

  gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd higgins

  install -d ${pkgdir}/usr/bin
  install -m755 higgins.gambas ${pkgdir}/usr/bin/higgins
  install -D appicon.png ${pkgdir}/usr/share/pixmaps/higgins.png
  install -D higgins.desktop ${pkgdir}/usr/share/applications/higgins.desktop
}

