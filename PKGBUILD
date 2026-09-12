# Maintainer: Wolfhound <aur at wolfhound dot dev>
# Rendered by packaging/publish-aur.sh from packaging/aur/yafst-bin/PKGBUILD.in
# on every tagged release. Edit the template in the yafst repo, not the AUR copy.
pkgname=yafst-bin
_tag=v0.2.0-beta.9
pkgver=0.2.0beta.9
pkgrel=1
pkgdesc="Linux-first ranked stats tracker for THE FINALS"
arch=('x86_64' 'aarch64')
url="https://forge.wolfhound.dev/wolfhound/yafst"
license=('MIT')
depends=('hicolor-icon-theme')
optdepends=('xdg-utils: open the dashboard in your browser on start'
            'chromium: dashboard in its own app window (any Chromium-based browser works)')
provides=('yafst')
conflicts=('yafst')
_dl="$url/releases/download/$_tag"
source_x86_64=("yafst-$_tag-linux-amd64.tar.gz::$_dl/yafst-$_tag-linux-amd64.tar.gz")
source_aarch64=("yafst-$_tag-linux-arm64.tar.gz::$_dl/yafst-$_tag-linux-arm64.tar.gz")
sha256sums_x86_64=('abdb43e791b51fca4d6dd5da10729239a889b024f8672f0caff0af0f418c46ec')
sha256sums_aarch64=('7001e9cd82ca06f87451c8a784e6f5b425bf4bebf7837f5e69d9b042011432c3')

package() {
    install -Dm755 yafst "$pkgdir/usr/bin/yafst"
    install -Dm644 dev.wolfhound.yafst.desktop "$pkgdir/usr/share/applications/dev.wolfhound.yafst.desktop"
    local s
    for s in 16 24 32 48 64 128 256; do
        install -Dm644 "icons/$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/dev.wolfhound.yafst.png"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
