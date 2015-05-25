# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=aur-search
pkgver=r32.1f3e22e1f574
pkgrel=1
pkgdesc="Search packages in AUR"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://code.google.com/p/mimarchlinux/"
depends=('pacman' 'glib2')
makedepends=('mercurial')
source=('hg+https://bitbucket.org/fabriceT/aur-search')
md5sums=('SKIP')

pkgver()
{
  cd aur-search
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build()
{
  cd aur-search
  make  
}

package()
{
  cd aur-search
  install -m755 -D aur-search ${pkgdir}/usr/bin/aur-search
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}

# vim:sw=2
