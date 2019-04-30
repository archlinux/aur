# Maintainer: Dominik Schrempf <dominik.schrempf@gmail.com>
pkgname=nextcloud-systemd-timers
pkgver=0.6
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
        "nextcloud-preview-pre-generate.service"
        "nextcloud-preview-pre-generate.timer"
        "nextcloud-preview-generate-all.service"
        "nextcloud-preview-generate-all.timer"
        "nextcloud-files-scan-all.service"
        "nextcloud-files-scan-all.timer")
sha256sums=('7fe27aa2ef2a034cf19a02571cefd1f6b40dd64fa48abda3ed0c82e2181f12c1'
            'b6ab6077a56e38b03e2ba669750aedc9cb84685f4cca7e9f3e9067f76d80c2a8'
            'bfaa2602d78f097c95e76d150423f83779384a737d41502bd8067b8f663b436f'
            '56e3cab181040101be05d4b7723825f7b0c082c34403e42c6f0934c6474a6a43'
            '18913873bf889f8b4d8bc2109d313fed02e523c86519ca96285640bf965732d5'
            'bd4bbd01a9d68e0217c3b48c977dda881fd956b53f981a6e32af0357d2e0b716'
            '86918017daa8f20208e1943fc53becdae5b96e7a15104bbedfdb7139d7c5dc66'
            '2f191059b619141ba883ae132af56460212c84eb208f087b87b79b0a3b9e4900')
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
