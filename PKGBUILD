# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('GPL3')
depends=('libadwaita' 'taglib' 'python-gobject' 'python-eyed3' 'python-pytaglib' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('f9b6ec2393c4288d9cae3f30662f75e25f210230934e93e2efdd72b6a96a817c301ceb8d93edb8e19ec28b38e36652b5fff0b6f26f5a6815ead68fbcf4c5a103')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
