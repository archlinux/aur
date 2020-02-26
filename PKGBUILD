pkgname=komikku-git
pkgver=v0.11.1+44+g8d6c146
pkgrel=1
pkgdesc='Online/offline Manga reader for GNOME, built for the Librem 5'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=('gtk3' 'libhandy' 'python' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'python-beautifulsoup4' 'python-cloudscraper' 'python-dateparser' 'python-lxml' 'python-magic-ahupp' 'python-pillow' 'python-pure-protobuf' 'python-unidecode')
makedepends=('git' 'gobject-introspection' 'meson')
provides=('komikku')
conflicts=('komikku')
source=("git+https://gitlab.com/valos/Komikku.git")
sha512sums=('SKIP')

pkgver() {
  cd Komikku
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson Komikku build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
} 
