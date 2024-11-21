# Maintainer: exu <aur _a_ frm01 _d_ net>
# Maintainer: Joshua Prince <aur _a_ jtprince _d_ com>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.18.2
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
sha256sums_x86_64=('e56d50b0a0d2a456c697e1d15fc9fa445d97e442367beda988ec85dd256adec1')
sha256sums_aarch64=('fb3873cfc3fc1c64d84e8c7d357b484fdc35afed04ba5769ed12d5674324064b')
sha256sums_armv7h=('b42bea25200fe4eca14ea2629654d9c5579fd316d868a0f76ceef44f0072a719')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
