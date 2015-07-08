# Maintainer:  ZavonAJ <zavon@zavon.org>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Brendan Taylor <whateley@gmail.com>
# Contributor: L42y <423300@gmail.com>

pkgname=uzbl-git
_gitname=uzbl
pkgver=20150322
pkgrel=1
pkgdesc="All uzbl web interface tools: latest from the git master branch"
arch=('i686' 'x86_64')
url="http://github.com/uzbl/uzbl"
license=('GPL3')
depends=('webkitgtk' 'socat' 'zenity' 'xclip' 'dmenu' 'python' 'pygtk' 'python-six')
makedepends=('git' 'pkgconfig')
provides=('uzbl-core' 'uzbl-browser' 'uzbl-tabbed')
conflicts=('uzbl-core' 'uzbl-browser' 'uzbl-tabbed' 'uzbl-experimental-git')
source=('uzbl::git+https://github.com/uzbl/uzbl.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  git log -n1 --format="%ci" | awk '{print $1}' | sed s/-//g
}

build() {
  cd $_gitname

  make
}

package() {
 
   cd $_gitname
  make DESTDIR="$pkgdir"/ PREFIX=/usr install 
  
  
  
  
}
