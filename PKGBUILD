# Maintainer: ewhal4 <ewhal4 at live dot com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
_gitname=i3session
pkgname=$_gitname-git
pkgver=2013.10.07.g0189d6c
pkgrel=1
pkgdesc="Remembers what's running in your i3 workspaces by saving a session file"
arch=('any')
url="https://github.com/joepestro/$_gitname"
license=('GPL')
depends=(python2-xdg python2-i3-git i3-wm xorg-xprop)
makedepends=('git')
source=("git://github.com/joepestro/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  sed -i '1 s:/python:/env python2:' "$_gitname"
  install -Dm755 $_gitname "$pkgdir/usr/bin/$_gitname"
}
