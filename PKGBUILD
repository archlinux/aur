# Contributor: 0chroma <me@chroma.sh>
# Contributor: BrainDamage
pkgname=libdecsync-bin
pkgver=2.2.1
pkgrel=4
pkgdesc='multiplatform library for synchronizing using DecSync'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/39aldo39/libdecsync'
license=(LGPL-2.0-only)
depends=(gcc-libs)  # libdecsync.so depends on libgcc_s.so.1
provides=(libdecsync)
conflicts=(libdecsync)

source_x86_64=("https://github.com/39aldo39/libdecsync/releases/download/v${pkgver}/libdecsync_amd64.so")
source_armv7h=("https://github.com/39aldo39/libdecsync/releases/download/v${pkgver}/libdecsync_arm32.so")
source_aarch64=("https://github.com/39aldo39/libdecsync/releases/download/v${pkgver}/libdecsync_arm64.so")

sha256sums_x86_64=('14ccf7505ecf0161740fc0a6df8a08300c745d95ffee070564b96dfec10bbb3e')
sha256sums_aarch64=('e8bb54ca7086d3d1d79b9987b904b34a6f4db3c9353b066f102f90cfffd5ab9b')
sha256sums_armv7h=('dd38de69752357a95bf20de94d2e6bbfdb19c30fba98a27bd05128b9f6493c8c')

package() {
    find "${srcdir}" -name '*.so' \
        -exec install -Dvm644 {} "${pkgdir}/usr/lib/libdecsync.so" \;
}
