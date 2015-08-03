# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=mussort
pkgver=20130804
pkgrel=1
epoch=
pkgdesc="mussort is a simple tool that sorts a music collection"
arch=('i686' 'x86_64')
url="http://random.zerodogg.org/mussort/"
license=('GPL')
groups=()
makedepends=("git")
depends=("perl" "id3v2" "vorbis-tools")
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/zerodogg/mussort.git
_gitname=mussort

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$_gitname/mussort" "$pkgdir/usr/bin/mussort"
}

# vim:set ts=2 sw=2 et:
