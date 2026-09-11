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
sha256sums_x86_64=('b64c56b740d32a70ec655e94a9582a5550412b0d093e864a5dbc7272a153f3ef')
sha256sums_aarch64=('8119e9b7a01190cc904cfbe8f39a19ad452367c689797ba3104fc32ace1ed1df')

package() {
    install -Dm755 yafst "$pkgdir/usr/bin/yafst"
    install -Dm644 dev.wolfhound.yafst.desktop "$pkgdir/usr/share/applications/dev.wolfhound.yafst.desktop"
    install -Dm644 dev.wolfhound.yafst.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.wolfhound.yafst.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
