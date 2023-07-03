# Maintainer : nyanmisaka <nst799610810@gmail.com>

pkgname=jellyfin-ffmpeg6-bin
pkgver=6.0
pkgrel=4
pkgdesc='FFmpeg6 binary version for Jellyfin'
arch=('x86_64' 'aarch64')
url='https://github.com/jellyfin/jellyfin-ffmpeg'
license=('GPL3')
depends_x86_64=('glibc>=2.23')
depends_aarch64=('glibc>=2.27')
optdepends=('intel-media-driver: for Intel VAAPI support (Broadwell and newer)'
            'intel-media-sdk: for Intel Quick Sync Video'
            'onevpl-intel-gpu: for Intel Quick Sync Video (12th Gen and newer)'
            'intel-compute-runtime: for Intel OpenCL runtime based Tonemapping'
            'libva-intel-driver: for Intel legacy VAAPI support (10th Gen and older)'
            'libva-mesa-driver: for AMD VAAPI support'
            'nvidia-utils: for Nvidia NVDEC/NVENC support'
            'opencl-amd: for AMD OpenCL runtime based Tonemapping'
            'vulkan-radeon: for AMD RADV Vulkan support'
            'vulkan-intel: for Intel ANV Vulkan support')
conflicts=('jellyfin-ffmpeg' 'jellyfin-ffmpeg5' 'jellyfin-ffmpeg5-bin' 'jellyfin-ffmpeg6')
source_x86_64=("https://repo.jellyfin.org/releases/ffmpeg/${pkgver}-${pkgrel}/jellyfin-ffmpeg_${pkgver}-${pkgrel}_portable_linux64-gpl.tar.xz")
source_aarch64=("https://repo.jellyfin.org/releases/ffmpeg/${pkgver}-${pkgrel}/jellyfin-ffmpeg_${pkgver}-${pkgrel}_portable_linuxarm64-gpl.tar.xz")
sha256sums_x86_64=('3d655fb88bc3910bea94077796846b420af815e1364a5c6254ce11b1252ac2ec')
sha256sums_aarch64=('1282a5780ae3cc004e90ddb970edcc2cb6c6afb8a088e5bdfe9afc98025dec8c')

package() {
    install -Dm 755 ffmpeg ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffmpeg
    install -Dm 755 ffprobe ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffprobe
}
