# Maintainer: CrossScar <crossscarcs@gmail.com>
pkgname=gng-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple puzzle game."
arch=('x86_64')
url="https://github.com/CommanderGL/gng"
license=('CC-BY-NC-SA-4.0')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf')
makedepends=('git' 'xxd')
source=('gng::git+https://github.com/CommanderGL/gng.git')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/gng/linux"
  mkdir bin
}

build() {
  cd "$srcdir/gng/linux"
  make assets
  make build
}

package() {
  cd "$srcdir/gng/linux"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  cp bin/gng $pkgdir/usr/bin/gng
  cp pkg/gng.desktop $pkgdir/usr/share/applications/gng.desktop
  cp ../assets/logo.png $pkgdir/usr/share/icons/hicolor/128x128/apps/gng.png
}
