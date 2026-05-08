# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

_appname="Codex-Proxy"
pkgname=codex-proxy-bin
pkgver=2.0.70
pkgrel=1
pkgdesc="Local proxy exposing ChatGPT Codex Responses API as OpenAI/Anthropic/Gemini-compatible endpoints"
arch=('x86_64')
url="https://github.com/icebear0828/codex-proxy"
license=('custom:non-commercial')
depends=('fuse2')
provides=('codex-proxy')
conflicts=('codex-proxy')
options=(!strip)
source=("$_appname-$pkgver-linux-x86_64.AppImage::$url/releases/download/v$pkgver/$_appname-$pkgver-linux-x86_64.AppImage")
sha256sums=('695846af059eab7a78d6649ad6d9d4256ec8c19332e3d5e0df8b68a4f920731c')
noextract=("$_appname-$pkgver-linux-x86_64.AppImage")

package() {
    install -Dm755 "$srcdir/$_appname-$pkgver-linux-x86_64.AppImage" \
        "$pkgdir/opt/codex-proxy/codex-proxy.AppImage"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/codex-proxy/codex-proxy.AppImage "$pkgdir/usr/bin/codex-proxy"
}
