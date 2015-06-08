#Maintainer: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>
pkgname=lunifybg-wpd-git
pkgver=20130108
pkgrel=1
pkgdesc="Modified version of lunifybg to accommodate wallpaperd."
arch=(any)
url="https://gist.github.com/4438979"
license=('public domain')
groups=()
depends=('imagemagick' 'wallpaperd')
makedepends=('git')

_gitroot="https://gist.github.com/4438979.git"
_gitname="lunifybg-wpd"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  install -Dm755 "$srcdir/$_gitname/$_gitname" "$pkgdir/usr/bin/$_gitname"
} 

