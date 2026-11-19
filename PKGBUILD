# Maintainer: go1em <guohw@aliyun.com>
pkgname=rustzip-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Fast, cross-platform archive manager written in Rust (prebuilt x86_64 build for Arch)"
arch=('x86_64')
url="https://github.com/yuhuotech/rustzip"
license=('MIT' 'Apache-2.0' 'LicenseRef-unrar')
depends=('alsa-lib' 'brotli' 'bzip2' 'gcc-libs' 'hicolor-icon-theme' 'icu' 'libxau' 'libxcb'
         'libxdmcp' 'libxkbcommon' 'libxkbcommon-x11' 'libxml2' 'openssl' 'zlib' 'zstd')
optdepends=('vulkan-icd-loader: Vulkan rendering backend')
provides=('rustzip')
conflicts=('rustzip')
source=("rustzip-bin-${pkgver}.tar.zst::https://github.com/go1em/rustzip-bin/releases/download/v${pkgver}/rustzip-bin-${pkgver}-1-${CARCH}.tar.zst")
sha256sums=('a6a81ce01f290eccdca36e3ecf3decf0c8f5095c7e12176b70606e268f351d96')

package() {
  tar --zstd -xf "${srcdir}/rustzip-bin-${pkgver}.tar.zst" --no-same-owner -C "${pkgdir}"
  mv "${pkgdir}/usr/share/licenses/rustzip" "${pkgdir}/usr/share/licenses/${pkgname}"
}
