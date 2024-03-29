# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=somafm
pkgver=1.2.10
_commit=7352044605cbdc176b9dd1578ce005995181d65f
pkgrel=1
pkgdesc='A simple radio with built-in stations from the website somafm.com'
url="https://github.com/alexkdeveloper/somafm"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gstreamer' 'libadwaita' 'libpulse')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson somafm build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.github.alexkdeveloper.somafm "$pkgdir/usr/bin/somafm"
}
