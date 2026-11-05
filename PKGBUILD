# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="An Open Source Lightweight E-Mail Client"
arch=(x86_64 aarch64)
url="https://aerion.3df.io"
license=(Apache-2.0)
depends=(at-spi2-core cairo gdk-pixbuf2 glib2 glibc gtk3 harfbuzz libsoup3 pango webkit2gtk-4.1 zlib)
provides=(aerion)
conflicts=(aerion)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/hkdb/aerion/releases/download/v$pkgver/aerion-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/hkdb/aerion/releases/download/v$pkgver/aerion-linux-arm64.tar.gz")
sha256sums_x86_64=('0bfd9bf2f331417c5ac03b357a20cf5c1fbb7209e124c91cd30c48ec95985dfb')
sha256sums_aarch64=('d5c4866bd59af3d0975583997249319fe21920585da88b8cfc0559279158d4a3')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" aerion
    install -Dm644 -t "$pkgdir/usr/share/applications/" io.github.hkdb.Aerion.desktop
    install -d "$pkgdir/usr/share/icons/hicolor/"
    cp -a icons/* "$pkgdir/usr/share/icons/hicolor/"
}
