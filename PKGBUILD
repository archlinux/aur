# Maintainer: Sergey Alexeyev s.n.alexeyev@gamil.com

author=s-n-alexeyev
pkgname=yvt
_gitname=yvt
pkgver=1.1.0.r0.gba4d567
pkgrel=1
pkgdesc='The script serves as a graphical interface for torctl/tor.'
arch=('any')
url='https://github.com/s-n-alexeyev/torctl-gui'
license=('GPL3')
depends=( 'vot-cli' 'ffmpeg'  'yt-dlp' 'jq')
makedepends=("git")
provides=("yvt")
source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
}


