# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: rafaqzsu <rafaqzsu [at] gmail (dot) com>

pkgname=cropgui-git
pkgver=0.5.r5.g150facd
pkgrel=1
epoch=1
pkgdesc='A GTK GUI for lossless JPEG cropping (and rotating)'
arch=('any')
url="https://emergent.unpythonic.net/01248401946"
license=('GPL')
depends=('python-pillow' 'libjpeg-turbo' 'pygtk' 'imagemagick' 'perl-image-exiftool')
makedepends=('git')
provides=('cropgui')
conflicts=('cropgui')
source=("$pkgname::git+https://github.com/jepler/cropgui")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  ./install.sh -f gtk -t $pkgdir -p /usr -P python
}
