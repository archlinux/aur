# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

_appname="Codex-Proxy"
pkgname=codex-proxy-bin
pkgver=2.1.6
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
sha256sums=('b4ff8c26668f4c7511d452140b4039190088853a203b218cd3545e1df9eeb3d2')
noextract=("$_appname-$pkgver-linux-x86_64.AppImage")

package() {
    install -Dm755 "$srcdir/$_appname-$pkgver-linux-x86_64.AppImage" \
        "$pkgdir/opt/codex-proxy/codex-proxy.AppImage"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/codex-proxy/codex-proxy.AppImage "$pkgdir/usr/bin/codex-proxy"
}
