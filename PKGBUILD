# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion-bin
pkgver=0.3.5
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
sha256sums_x86_64=('b2f35ae1e30e0e4ee3415fb7efe22f6ee6f06752d0ad7aa42b7f8d48ba6bf76a')
sha256sums_aarch64=('f355b8e100006a784f3b129db051071f0374a3e2abc761753eb6444dd14bb64a')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" aerion
    install -Dm644 -t "$pkgdir/usr/share/applications/" io.github.hkdb.Aerion.desktop
    install -d "$pkgdir/usr/share/icons/hicolor/"
    cp -a icons/* "$pkgdir/usr/share/icons/hicolor/"
}
