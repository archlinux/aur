# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.27.0
pkgrel=1
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
sha256sums_aarch64=('8d5b29866b4a27c159dfc93b2ff968ca7f2c6cf20b17a1c8943d55c6aec642da')
sha256sums_riscv64=('7506e3156a56da6bb5678ce8c1d9e8b3fca2749f2e363413c959d4944d53b590')
sha256sums_x86_64=('a67e1a7277c3e1f20fc558b77c15b6674874d14410f20272a5536461b3061b51')

package() {
    install -Dm755 homebox -t "$pkgdir/usr/bin/"
    install -Dm644 homebox.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 homebox.default "$pkgdir/etc/default/homebox"
}

