# Maintainer: exu <aur _a_ frm01 _d_ net>
# Maintainer: Joshua Prince <aur _a_ jtprince _d_ com>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.22.0
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url='https://kopia.io/'
license=('APACHE')
optdepends=('fuse3: mounting snapshots locally')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("app-update.yml")
source_x86_64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_armv7l.deb")
sha256sums=('6e04ed70f54a3d70c22240cd6e4f65df4ad2f3e8aa1608aca20dc91c594bd83b')
sha256sums_x86_64=('cf07756926c0b9a94d959e6c3bdb3ed9fca096460ad61a8b76c1fbb25bd7708d')
sha256sums_aarch64=('3c63d090ade0ac32d1e970552919de90ca8bd8ae40ce32a0eeb68eba1b401633')
sha256sums_armv7h=('73d74096f1320f8f53a6499e74f57c5a0e7c3997bda10b68629d557f61a0f9da')
options=('!debug')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
