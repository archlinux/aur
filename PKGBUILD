#! /bin/bash
# Contributor: x-demon 
# Maintainer : Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=nicotine-plus-git
pkgver=037e16c
pkgrel=3
pkgdesc="A fork of nicotine, a Soulseek music-sharing client written in python. Gitversion."
arch=('i686' 'x86_64')
url=("http://nicotine-plus.org")
license=('GPL')
depends=('pygtk' 'gtk2')
makedepends=('git' 'python2')
optdepends=('mutagen: To improve metadata'
	    'python-sexy: To enable spell checking'
	    'python-geoip: To enable Geographical blocker')
conflicts=('nicotine' 'nicotine-plus')
replaces=('nicotine' 'nicotine-plus')
source=(git+https://github.com/eLvErDe/nicotine-plus.git)
sha512sums=('SKIP')

_gitname=nicotine-plus

pkgver() {
  cd ${srcdir}/$_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"

  python2 setup.py install --root=$srcdir/pkg
}

package(){
  mv ${srcdir}/pkg/* ${pkgdir}  
}
