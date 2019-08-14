# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tootle-git
pkgver=0.2+r26+g1e42721
pkgrel=1
pkgdesc='GTK+ 3 client for Mastodon (git)'
arch=(i686 x86_64)
url=https://github.com/bleakgrey/tootle
license=(GPL3)
depends=(gtk3 libgee granite)
makedepends=(git meson ninja vala)
provides=(tootle)
conflicts=(tootle)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd tootle
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd tootle
  arch-meson build
  ninja -C build
}

package() {
  cd tootle
  DESTDIR="$pkgdir" ninja -C build install
}
