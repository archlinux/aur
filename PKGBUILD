# Maintainer : nyanmisaka <nst799610810@gmail.com>

pkgname=jellyfin-ffmpeg6-bin
pkgver=6.0
pkgrel=5
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
sha256sums_x86_64=('2102c4dbb1d1b0879212d6926189e6e7b7b0d438fb9649209d676d00aff63849')
sha256sums_aarch64=('187342d1f4f9724704abfc3cf208f4ce32594d502736f2e652b09dfd4dffedb6')

package() {
    install -Dm 755 ffmpeg ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffmpeg
    install -Dm 755 ffprobe ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffprobe
}
