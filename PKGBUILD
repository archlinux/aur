# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com
 
pkgname=bash-supergenpass
pkgver=20130529
pkgrel=1
pkgdesc="Bash implementation of Super Gen Pass script"
url="http://github.com/lanzz/bash-supergenpass"
arch=('any')
license=('custom')
install=
source=()
depends=('bash' 'openssl')
optdepends=()
conflicts=('perl-supergenpass')
provides='supergenpass'
makedepends=()

_gitname="bash-supergenpass"
_gitroot="git://github.com/lanzz/${_gitname}.git"
 
 
build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."
 
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone $_gitroot $_gitname
  fi
 
  msg "GIT checkout done or server timeout"
}
 
package() {
    cd $srcdir/${_gitname}
    mkdir -p $pkgdir/usr/bin
    install -m755 supergenpass.sh $pkgdir/usr/bin/supergenpass
    chmod +x $pkgdir/usr/bin/supergenpass
}
