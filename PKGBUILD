pkgname=zz-beta-bin
_version=0.29.0
pkgver=0.29.0
pkgrel=1
pkgdesc='Terminal, browser, and agent workspace'
arch=('x86_64' 'aarch64')
url='https://github.com/autistic-computer/zebrilus'
license=('MIT OR Apache-2.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'fontconfig'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libcups'
    'libgcc'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'wayland'
)
optdepends=('org.freedesktop.secrets: import encrypted Chrome cookies')
provides=('zz')
conflicts=('zz' 'zz-bin')
options=('!debug' '!strip')
source_x86_64=("$url/releases/download/v$_version/zz-$_version-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$_version/zz-$_version-linux-aarch64.tar.gz")
sha256sums_x86_64=('f4ea503c8599fa543a2276b24df9bcb749caa219ece5bf424fe3a8993c43c4d5')
sha256sums_aarch64=('7cefb6b89816ebf2aaf5af7a878307d164e562edb16a653f1254df8709b26e2d')

package() {
    install -d "$pkgdir/usr"
    cp -a --no-preserve=ownership "$srcdir/zz-$_version-linux-$CARCH/usr/." "$pkgdir/usr/"
    chmod 0755 "$pkgdir/usr/lib/zz/zz" "$pkgdir/usr/lib/zz/cli" "$pkgdir/usr/lib/zz/chrome-sandbox"
    ln -s zz "$pkgdir/usr/share/licenses/$pkgname"
}
