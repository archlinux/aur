pkgname=zz-beta-bin
_version=0.24.0
pkgver=0.24.0
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
sha256sums_x86_64=('eb8ae1a9b42e115a1835cf0e345b937dc518b9881fc0b9ece340251f4c256e09')
sha256sums_aarch64=('b57edc189318ab39afd83cdcb363d7c06d50359d8683d627b22eb4e10183fa14')

package() {
    install -d "$pkgdir/usr"
    cp -a --no-preserve=ownership "$srcdir/zz-$_version-linux-$CARCH/usr/." "$pkgdir/usr/"
    chmod 0755 "$pkgdir/usr/lib/zz/zz" "$pkgdir/usr/lib/zz/cli" "$pkgdir/usr/lib/zz/chrome-sandbox"
    ln -s zz "$pkgdir/usr/share/licenses/$pkgname"
}
