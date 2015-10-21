# Maintainer: Christopher Hamilton <marker5a@gmail.com>

pkgname=easyterm
pkgver=0.9
pkgrel=1
pkgdesc='Serial Port Terminal Emulator'
arch=('x86_64' 'i686')
url='http://sourceforge.net/projects/easyterm/'

license=('GPLv3')
depends=('qt5')
depends=()
makedepends=('git')
optdepends=()
provides=()
conflicts=()
source=()
md5sums=()
_gitroot="http://git.code.sf.net/p/easyterm/code easyterm"
_gitname="easyterm"

build() {
  cd ${srcdir}/
  
  msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
    fi
  
  cd "$srcdir/$_gitname"
    
  
  qmake .
  make
}

package() {
	echo "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/local/bin"
	cp "$srcdir/$_gitname/release/EasyTerm" "$pkgdir/usr/local/bin"
}

# vim:set ts=2 sw=2 et:
