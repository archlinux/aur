# Maintainer: Diego Francisco Hernandez <personal.diegofranciscoh@protonmail.com>

pkgname=background-wallpaper-slideshow-git
_pkgname=background-wallpaper-slideshow
pkgver=1.3.r0.g2b27210
pkgrel=1
pkgdesc="A simple bash script that changes the background wallpaper periodically."
arch=('any')
url="https://github.com/DiegoFHG/background-wallpaper-slideshow"
license=('GPL3')
depends=('nitrogen' 'bash')
makedepends=('git')
md5sums=('SKIP')
source=('background-wallpaper-slideshow::git+https://github.com/DiegoFHG/background-wallpaper-slideshow.git#branch=master')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
        cd "$srcdir/$_pkgname"
	install -Dm755 "slideshow.sh" "$pkgdir/usr/bin/background-wallpaper-slideshow"
}
