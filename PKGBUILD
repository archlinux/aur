# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.27.1
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
sha256sums_aarch64=('6e0bfe5859e7ca4aebb814d6c0a85b9e5392361717d2366b464bbf77ee605594')
sha256sums_riscv64=('a2dcd7439a93c042d1922b33cd716a23e08692f20d375daa227ccd84c7fe4bc7')
sha256sums_x86_64=('8fc79c96a1317c58b652165e7cc221787c7b89eb03cb57b5e3a4139e6e17a2c0')

package() {
    install -Dm755 homebox -t "$pkgdir/usr/bin/"
    install -Dm644 homebox.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 homebox.default "$pkgdir/etc/default/homebox"
}

