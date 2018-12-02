# Maintainer: Dominik Schrempf <dominik.schrempf@gmail.com>
pkgname=nextcloud-systemd-timers
pkgver=0.5
pkgrel=2
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
        "nextcloud-preview-pre-generate.service"
        "nextcloud-preview-pre-generate.timer"
        "nextcloud-preview-generate-all.service"
        "nextcloud-preview-generate-all.timer"
        "nextcloud-files-scan-all.service"
        "nextcloud-files-scan-all.timer")
md5sums=('53a5345c92f56045c59cb3ffd91b20fc'
         '15826e34b6d24b9fe7d1eaa8df27c026'
         '4d6a98593b90f9aed1bdcb186bc4ca5c'
         'b986c3d1a3ca1243a0c25ea0b835598c'
         '979a3979fa0fa2fba3a3fe94d877f3d9'
         '05faa4afcc1705a8c03f0d197e0e763f'
         '01ff280f5a1ca4d4f49cce54d72e7cb9'
         '67dff9d43283939a02c3779266e2c3d3')
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
  install -D -t $pkgdir/etc/systemd/system -m 644 \
          nextcloud-cron.service \
          nextcloud-cron.timer \
          nextcloud-files-scan-all.service \
          nextcloud-files-scan-all.timer \
          nextcloud-preview-generate-all.service \
          nextcloud-preview-generate-all.timer \
          nextcloud-preview-pre-generate.service \
          nextcloud-preview-pre-generate.timer
}

# vim:set ts=2 sw=2 et:
