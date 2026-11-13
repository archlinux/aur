pkgname=zz-bin
_version=0.23.0
pkgver=0.23.0
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
conflicts=('zz' 'zz-beta-bin')
options=('!debug' '!strip')
source_x86_64=("$url/releases/download/v$_version/zz-$_version-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$_version/zz-$_version-linux-aarch64.tar.gz")
sha256sums_x86_64=('3bc2d54f1acb215bfb6e9035cdf6237d708945043d7685d2537ac6a873e12a41')
sha256sums_aarch64=('c5fb6d993bac19ee40176e86a72841671b067d6389e31c25be1a1cee5a5a7f57')

package() {
    install -d "$pkgdir/usr"
    cp -a --no-preserve=ownership "$srcdir/zz-$_version-linux-$CARCH/usr/." "$pkgdir/usr/"
    chmod 0755 "$pkgdir/usr/lib/zz/zz" "$pkgdir/usr/lib/zz/cli" "$pkgdir/usr/lib/zz/chrome-sandbox"
    ln -s zz "$pkgdir/usr/share/licenses/$pkgname"
}
