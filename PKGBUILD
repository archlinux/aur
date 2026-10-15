# Maintainer: Eser KUBALI <eserlxl@gmail.com>
pkgname=linux-cleaner
pkgver=1.4.1
pkgrel=1
pkgdesc="Safe, configuration-driven cleaner for caches and temporary files"
arch=('any')
url="https://github.com/eserlxl/cleaner"
license=('GPL-3.0-or-later')
depends=('bash' 'findutils' 'coreutils')
optdepends=('pacman-contrib: paccache-based package-cache actions')
backup=('etc/linux-cleaner/cleaner.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Pinned sha256 of the v$pkgver release tarball. After each version bump, run
# `updpkgsums` once the tag is pushed (see RELEASING.md "Packaging"); never
# publish with 'SKIP'.
sha256sums=('3793c396cecfd32b26121f6cd8b776dfc6502b9a86eddec93de16b3cb153a898')

package() {
  cd "$srcdir/cleaner-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
