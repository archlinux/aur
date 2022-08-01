# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=eartag
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple music tag editor"
arch=('any')
url="https://github.com/knuxify/eartag"
license=('GPL3')
depends=('libadwaita' 'taglib' 'python-gobject' 'python-eyed3' 'python-pytaglib' 'python-magic')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/$pkgver.tar.gz)
b2sums=('21407b577e6a3eed46e77c250cf5a4b21522b4772136e313b6024766f783923c559cb4abb11af86e9560b597b75f76d0504a8fc7b111e92fae2e98460ba26a5a')

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
