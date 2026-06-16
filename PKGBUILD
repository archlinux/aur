# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tarball <bootctl@gmail.com>

pkgname=homebox-bin
pkgver=0.26.2
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
sha256sums_aarch64=('a7197a54b830a21be0142c5b4b3dd3a730d5d6a0599aa680d089b4e128d82f12')
sha256sums_riscv64=('250c4436bb0a71196dd20fc2ef256cb45b2dc1f63bbc28210913212f78fa4a71')
sha256sums_x86_64=('078f50ee25de546483d84c0f9ccc587edac6039cde87142fbea39c9ca87dcb05')

package() {
    install -Dm755 homebox -t "$pkgdir/usr/bin/"
    install -Dm644 homebox.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 homebox.default "$pkgdir/etc/default/homebox"
}

