# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=ydcv-git
pkgver=20120920
pkgrel=1
pkgdesc="YouDao Console Version - Simple wrapper for Youdao online translate (Chinese <-> English) service API, as an alternative to the StarDict Console Version(sdcv) - Git version"
arch=("any")
conflicts=("ydcv")
provides=("ydcv")
url="https://github.com/felixonmars/ydcv"
license=("GPL")
depends=('python2')

_gitroot=git@github.com:felixonmars/ydcv.git
_gitname=ydcv

build() {
  cd "$srcdir"
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  install -Dm755 "${srcdir}/$_gitname/$_gitname.py" "${pkgdir}/usr/bin/$_gitname"
}

# vim:set ts=2 sw=2 et:
