# Maintainer: exu <aur _a_ frm01 _d_ net>
# Maintainer: Joshua Prince <aur _a_ jtprince _d_ com>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.21.1
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=2
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
sha256sums_x86_64=('54fb7335a9689b4e266799e79bec6e69f8c64327a37af1923b1d2b471eb51e73')
sha256sums_aarch64=('a61d4795c01a9fd5a1bf48cfb76b9b959e09f65bc4147f29aba99032410ba45a')
sha256sums_armv7h=('c5f0cb6491d46f4afe0aefee49e318097030d28aa0becee1d1a0bab8dee1990d')
options=('!debug')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
