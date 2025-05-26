# Maintainer: exu <aur _a_ frm01 _d_ net>
# Maintainer: Joshua Prince <aur _a_ jtprince _d_ com>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.20.1
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
sha256sums_x86_64=('ada4a4742665f6169c38cda80684340f9b8f0b2a4ca4d7f5be80f48d7a79e3d6')
sha256sums_aarch64=('876d06b4c47324876384f1fc148e360f92fe89324af5bfd917749bf2147079a9')
sha256sums_armv7h=('e998ef82634e5afc7a27794bc524bb1462d325b4b255b1ce21b2439a41d9f933')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
