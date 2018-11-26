# Maintainer: Dominik Schrempf <dominik.schrempf@gmail.com>
pkgname=nextcloud-systemd-cron
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="Systemd service and timer for Nextcloud Cron background jobs (see Nextcloud Arch Wiki entry)."
arch=('any')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=nextcloud-systemd-cron.install
changelog=
source=("nextcloudcron.service"
        "nextcloudcron.timer"
        "nextcloud-preview.service"
        "nextcloud-preview.timer")
md5sums=('78dbe72845222ad01aafb60f32f828e8'
         'c8fabd54720ad97c472a842a1d91f5b1'
         'a019ced938dc5a6c1cc59e05c5a88be3'
         '435d1a3537471163e3cc1c304e4fae76')
noextract=()

# prepare() {
#   cd "$srcdir/$pkgname-$pkgver"
#   patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
#   cd "$srcdir/$pkgname-$pkgver"
#   ./configure --prefix=/usr
#   make
# }

# check() {
#   cd "$srcdir/$pkgname-$pkgver"
#   make -k check
# }

package() {
  # cd "$srcdir/$pkgname-$pkgver"
  # make DESTDIR="$pkgdir/" install
  install -D -m 644 nextcloudcron.service $pkgdir/etc/systemd/system/nextcloudcron.service
  install -D -m 644 nextcloudcron.timer $pkgdir/etc/systemd/system/nextcloudcron.timer
  install -D -m 644 nextcloud-preview.service $pkgdir/etc/systemd/system/nextcloud-preview.service
  install -D -m 644 nextcloud-preview.timer $pkgdir/etc/systemd/system/nextcloud-preview.timer
}

# vim:set ts=2 sw=2 et:
