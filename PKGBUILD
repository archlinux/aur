# Maintainer: Marco Bartkowiak <marco.bartkowiak@ruhr-uni-bochum.de>

_name='showdown'
pkgname=$_name-git
pkgver=0.6.r4.g0e07f5e
pkgrel=1
pkgdesc="A gnome application that allows you to view Markdown"
arch=('any')
url="https://craigbarnes.gitlab.io/showdown/"
license=('GPL3')
depends=('discount' 'webkit2gtk' 'gtk-update-icon-cache')
provides=($_name)
conflicts=($_name)
makedepends=('vala' 'gcc' 'git' 'make' 'gtk3' 'glib2' 'webkit2gtk' 'discount' 'libxml2')
source=("git+https://github.com/craigbarnes/showdown.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  make
}

package() {
  cd "$_name"
  make prefix=/usr DESTDIR="$pkgdir" install
}
