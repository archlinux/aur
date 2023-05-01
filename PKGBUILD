# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=kopia-ui-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.13.0
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
sha256sums_x86_64=('883f1a6a742832cf6fc517cb0cf775378b9c91c32f1e0a88becd66b15cbd00a4')
sha256sums_aarch64=('db7bb0ed82859f61a9c57b3135c4cee35fc1e7e31f6250edeedf22fb1e0903d5')
sha256sums_armv7h=('3e98195cdb495cb430caefc62403d16e006651b221582f072eb946eb3d00806e')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    cp app-update.yml "$pkgdir/opt/KopiaUI/resources"
}
