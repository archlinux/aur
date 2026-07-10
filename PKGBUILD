# Maintainer: umceko <support@stockimg.ai>
pkgname=hush-mic-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="NVIDIA Maxine AI noise-suppression virtual microphone (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/UMCEKO/hush"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib-networking' 'pipewire' 'libpulse' 'dbus' 'gcc-libs')
optdepends=('nvidia-utils: nvidia-smi GPU detection (required at runtime)')
provides=('hush-mic')
# 'hush'/'hush-bin' (an unrelated Lua shell) also install /usr/bin/hush
conflicts=('hush-mic' 'hush' 'hush-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/UMCEKO/hush/releases/download/v$pkgver/hush_v${pkgver}_x86_64-linux.tar.gz")
sha256sums=('9b249b30dac83893a49c6f78bc6b007c641290b28844f0eeff943867f5264dd6')

package() {
    cd "hush_v${pkgver}_x86_64-linux"
    install -Dm755 hush  "$pkgdir/usr/bin/hush"
    install -Dm755 hushd "$pkgdir/usr/bin/hushd"
    install -Dm644 io.github.umceko.hush.desktop "$pkgdir/usr/share/applications/io.github.umceko.hush.desktop"
    install -Dm644 hush.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hush.svg"
    install -Dm644 NVIDIA_NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname/NVIDIA_NOTICE.txt"
    install -Dm644 FONT_LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/FONT_LICENSES.txt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
