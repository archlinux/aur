# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.25.0
pkgrel=2
pkgdesc='Inventory and organization system built for the Home User'
url='https://github.com/sysadminsmedia/homebox'
arch=(aarch64 riscv64 x86_64)
license=(AGPL-3.0-only)
provides=(homebox)
conflicts=(homebox)
depends=(glibc libwebp libavif libheif libjxl)

source=('homebox.service' 'homebox.default')
source_aarch64=("homebox-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/homebox_Linux_arm64.tar.gz")
source_riscv64=("homebox-$pkgver-riscv64.tar.gz::$url/releases/download/v$pkgver/homebox_Linux_riscv64.tar.gz")
source_x86_64=("homebox-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/homebox_Linux_x86_64.tar.gz")

sha256sums=('bb759217a883f50712f98bbf2527136061a082ea5fd2c9db211ee15c98cb7150'
            '9955a5b215d040cbb71699cf0bd28a7386cc29ea3106c5a926c5d0fe79060443')
sha256sums_aarch64=('600261d94b1060b0b7d42a31bc0c3a2125187c5e546a45d4b2908b2bec492e67')
sha256sums_riscv64=('1c8f293d25194aeaca42fb3d01de1e6631db03bf09c6aa6ed62e85008419806d')
sha256sums_x86_64=('a1437725abdb5e0360e66c9e9ffd7a9ef8df1f823d8fc4ccaf5d567f5df77940')

package() {
    install -Dm755 homebox -t "$pkgdir/usr/bin/"
    install -Dm644 homebox.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 homebox.default "$pkgdir/etc/default/homebox"
}

