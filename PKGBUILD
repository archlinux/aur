pkgname=garmin-tracker-rs
pkgver=1.1.3
pkgrel=1
pkgdesc='Sync your devices and track your strength training'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgname}"
license=('GPL-2')
makedepends=(
  'rust'
)
source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

depends=(
  webkit2gtk-4.1
  zlib-ng-compat
)
makedepends=(
  'rust'
  'npm'
  'pnpm'
)

build() {
  cd "$srcdir/${pkgname}"
  make build
}

package() {
  cd "$srcdir/${pkgname}/src-tauri/target/release/bundle/deb"
  cp -a Garmin\ Fit\ Tracker_${pkgver}_*/data/* "${pkgdir}"
}