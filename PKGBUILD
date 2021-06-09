# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=appimage-thumbnailer-git
pkgver=6.f736e8f
pkgrel=1
pkgdesc="AppImage thumbnailer for file-managers like nautilus, nemo, etc"
arch=(any)
url="https://github.com/realmazharhussain/appimage-thumbnailer"
license=('GPL v3')
depends=('bash' 'imagemagick')
makedepends=()
provides=('appimage-thumbnailer')
conflicts=('appimage-thumbnailer')
source=("$pkgname"::'git+https://github.com/realmazharhussain/appimage-thumbnailer.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
}
