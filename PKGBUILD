# Maintainer: Dominik Schrempf <dominik.schrempf@gmail.com>
pkgname=nextcloud-systemd-timers
pkgver=0.8.0
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
conflicts=()
replaces=()
backup=()
options=()
install=nextcloud-systemd-timers.install
changelog=
source=("nextcloud-app-update-all.service"
        "nextcloud-app-update-all.timer"
        "nextcloud-cron.service"
        "nextcloud-cron.timer"
        "nextcloud-files-scan-all.service"
        "nextcloud-files-scan-all.timer"
        "nextcloud-preview-generate-all.service"
        "nextcloud-preview-generate-all.timer"
        "nextcloud-preview-pre-generate.service"
        "nextcloud-preview-pre-generate.timer")
sha256sums=('5977e1ea5893fa36ad022f3a080d9b0ebfa9ab90e6b37ac884546e5311df46be'
            '39039f1a3dc23022fccc991daca86d77e7d41be275566f6892cd6b290fa0da4a'
            'e1d841b6b133a6c9bed910297a7d899f5669d7e759c1dca1a288658f96576713'
            'a7db3a28abfee48393bd70dc71e9abf813130169229f2a35b072cc11dbd09863'
            '58cb60d2630248cf92ddb15e18f455d6ffe6d6b151173fc7d975d622e28e32fa'
            '2f191059b619141ba883ae132af56460212c84eb208f087b87b79b0a3b9e4900'
            'a8fc7e7431086a19a19729e9c71f7d5b26c8e2cb51d76b2c41dbd982f109f713'
            'bd4bbd01a9d68e0217c3b48c977dda881fd956b53f981a6e32af0357d2e0b716'
            '6bb27c8b9f67121c5f68cd265393f43ad6d82b9576bbb970844f10df951c42fe'
            '56e3cab181040101be05d4b7723825f7b0c082c34403e42c6f0934c6474a6a43')
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
  install -D -t $pkgdir/usr/lib/systemd/system -m 644 \
          nextcloud-app-update-all.service \
          nextcloud-app-update-all.timer \
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
