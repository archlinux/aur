# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=hackgregator
pkgver=0.4.0
pkgrel=1
pkgdesc="This application is a comfortable reader application for news.ycombinator.com"
arch=('x86_64')
url="https://gitlab.com/gunibert/hackgregator"
license=('GPL3')
depends=('glib2' 'libadwaita' 'libsoup3' 'json-glib' 'webkit2gtk-5.0')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('d25a9561bf3cd89da54a782feb4674f6b8cd42a1f9ea104aa81f00f2c94976ea715820d203896ea526be3a6a9739e3893f335356436cbe564926a6e2600b35f9')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
