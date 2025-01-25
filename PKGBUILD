# Maintainer: exu <aur _a_ frm01 _d_ net>
# Maintainer: Joshua Prince <aur _a_ jtprince _d_ com>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.19.0
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
sha256sums_x86_64=('04338e1af6ee201691330da57642c218f4c057e7da5104070a9c2866f203cf9c')
sha256sums_aarch64=('35f57389dcb0463bb61f24bc1d8fea602a331c6382b5511b55aedd06749ac598')
sha256sums_armv7h=('a79b133b70afac76a4b6ec4da4050c5f9f845218e90ec47d83091263d21aae2b')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
