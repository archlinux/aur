# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=somafm
pkgver=1.2.9
pkgrel=1
pkgdesc='A simple radio with built-in stations from the website somafm.com'
url="https://github.com/alexkdeveloper/somafm"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gstreamer' 'libadwaita' 'libpulse')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
_commit=44bc0ca641cf0e668b43c7648771c11ea3ad1098
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
