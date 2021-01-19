# Maintainer: Dominik Schrempf <dominik.schrempf@gmail.com>
pkgname=nextcloud-systemd-timers
pkgver=0.7.0
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
sha256sums=('231419498bda90a47a20927be414e126871877ddefb8234970942b75ce092349'
            '39039f1a3dc23022fccc991daca86d77e7d41be275566f6892cd6b290fa0da4a'
            '7fe27aa2ef2a034cf19a02571cefd1f6b40dd64fa48abda3ed0c82e2181f12c1'
            'a7db3a28abfee48393bd70dc71e9abf813130169229f2a35b072cc11dbd09863'
            'a5bbae53fd6de8a7a2de7ff07e74ee8b709b1950e6a4d817e80550ad9da8c65e'
            '2f191059b619141ba883ae132af56460212c84eb208f087b87b79b0a3b9e4900'
            '73c33917bb69889efecd9c47fe4f99910419e7cfdeea012f68d9f4b73dc74cb8'
            'bd4bbd01a9d68e0217c3b48c977dda881fd956b53f981a6e32af0357d2e0b716'
            '98ec0f1a78738d2aa2497b8b01faad4b9e9c44f90988ef3e592257dd2eef9bc8'
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
