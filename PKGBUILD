# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=smart-wallpaper-git
_gitname=smart-wallpaper
pkgver=0
pkgrel=1
pkgdesc='Simple script to set a different wallpaper when its daytime/nightime.'
url='https://github.com/Baitinq/smart-wallpaper.git'
arch=('any')
license=('GPL')
depends=('redshift' 'feh-git' 'xwinwrap')
optdepends=('gifsicle: support for animated backgrounds (.gif)' 'mpv: support for videos')
makedepends=('git')
provides=('smart-wallpaper')

source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$_gitname"
  install -Dm755 smart-wallpaper "${pkgdir}/usr/bin/$_gitname"
  chmod +x "$pkgdir/usr/bin/$_gitname"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$_gitname"
  chmod -R 777 "$pkgdir/usr/share/$_gitname"

}
