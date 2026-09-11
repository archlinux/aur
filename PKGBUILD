# Maintainer: Wolfhound <aur at wolfhound dot dev>
# Rendered by packaging/publish-aur.sh from packaging/aur/yafst-bin/PKGBUILD.in
# on every tagged release. Edit the template in the yafst repo, not the AUR copy.
pkgname=yafst-bin
_tag=v0.2.0-beta.3
pkgver=0.2.0beta.3
pkgrel=1
pkgdesc="Linux-first ranked stats tracker for THE FINALS"
arch=('x86_64' 'aarch64')
url="https://forge.wolfhound.dev/wolfhound/yafst"
license=('MIT')
depends=('hicolor-icon-theme')
optdepends=('xdg-utils: open the dashboard in your browser on start')
provides=('yafst')
conflicts=('yafst')
_dl="$url/releases/download/$_tag"
source_x86_64=("yafst-$_tag-linux-amd64.tar.gz::$_dl/yafst-$_tag-linux-amd64.tar.gz")
source_aarch64=("yafst-$_tag-linux-arm64.tar.gz::$_dl/yafst-$_tag-linux-arm64.tar.gz")
sha256sums_x86_64=('78a1a581b487467674adf93c254d371abcf0ce58b7757a9dfce9b2fad6412ec5')
sha256sums_aarch64=('f5d5961a1a12e0e8b37070a345d3221bafd85402f545f78a68fb404fba6d848a')

package() {
    install -Dm755 yafst "$pkgdir/usr/bin/yafst"
    install -Dm644 dev.wolfhound.yafst.desktop "$pkgdir/usr/share/applications/dev.wolfhound.yafst.desktop"
    install -Dm644 dev.wolfhound.yafst.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.wolfhound.yafst.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
