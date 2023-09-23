# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=inspektor
pkgver=2.0.4
pkgrel=2
pkgdesc='View metadata information on files'
arch=('any')
url='https://github.com/hezral/inspektor'
license=('GPL3')
depends=('attr' 'granite' 'perl-image-exiftool' 'python-opencv')
makedepends=('git' 'meson')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  ln -fs /usr/bin/com.github.hezral.$pkgname "$pkgdir/usr/bin/$pkgname"
}
