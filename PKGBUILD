# Maintainer: CrossScar <crossscarcs@gmail.com>
pkgname=gng-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.0.0
pkgrel=1
pkgdesc="A simple puzzle game."
arch=('x86_64')
url="https://github.com/CommanderGL/gng"
license=('CC-BY-NC-SA-4.0')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sudo')
makedepends=('git' 'base-devel' 'vim')
source=('gng::git+https://github.com/CommanderGL/gng.git')
sha256sums=('SKIP')
install="gng.install"

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
  sudo cp bin/gng /usr/bin/gng
  sudo cp pkg/gng.desktop /usr/share/applications/gng.desktop
  sudo cp ../assets/logo.png /usr/share/icons/hicolor/128x128/apps/gng.png
}
