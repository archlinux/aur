# Maintainer: Dominik Schrempf <dominik.schrempf@gmail.com>
pkgname=nextcloud-systemd-timers
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="Systemd services and timers for Nextcloud background jobs (see Nextcloud Arch Wiki entry)."
arch=('any')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(nextcloud-systemd-cron)
replaces=()
backup=()
options=()
install=nextcloud-systemd-timers.install
changelog=
source=("nextcloud-cron.service"
        "nextcloud-cron.timer"
        "nextcloud-preview.service"
        "nextcloud-preview.timer"
        "nextcloud-filescan.service"
        "nextcloud-filescan.timer")
md5sums=('78dbe72845222ad01aafb60f32f828e8'
         'fff77f3c2c11c5928470cd0816ec4b4e'
         'a019ced938dc5a6c1cc59e05c5a88be3'
         'a9cbb757ac34fcf636653086afd581d5'
         'ca8393b6ddb3cc4d23cef10ec02bc271'
         '6860cf4c5b712c37a1f942d661256107')
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
  install -D -m 644 nextcloud-cron.service $pkgdir/etc/systemd/system/nextcloud-cron.service
  install -D -m 644 nextcloud-cron.timer $pkgdir/etc/systemd/system/nextcloud-cron.timer
  install -D -m 644 nextcloud-preview.service $pkgdir/etc/systemd/system/nextcloud-preview.service
  install -D -m 644 nextcloud-preview.timer $pkgdir/etc/systemd/system/nextcloud-preview.timer
  install -D -m 644 nextcloud-filescan.service $pkgdir/etc/systemd/system/nextcloud-filescan.service
  install -D -m 644 nextcloud-filescan.timer $pkgdir/etc/systemd/system/nextcloud-filescan.timer
}

# vim:set ts=2 sw=2 et:
