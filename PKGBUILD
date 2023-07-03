# Maintainer : nyanmisaka <nst799610810@gmail.com>

pkgname=jellyfin-ffmpeg5-bin
pkgver=5.1.3
pkgrel=3
pkgdesc='FFmpeg5 binary version for Jellyfin'
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
conflicts=('jellyfin-ffmpeg' 'jellyfin-ffmpeg5')
source_x86_64=("https://repo.jellyfin.org/releases/ffmpeg/${pkgver}-${pkgrel}/jellyfin-ffmpeg_${pkgver}-${pkgrel}_portable_linux64-gpl.tar.xz")
source_aarch64=("https://repo.jellyfin.org/releases/ffmpeg/${pkgver}-${pkgrel}/jellyfin-ffmpeg_${pkgver}-${pkgrel}_portable_linuxarm64-gpl.tar.xz")
sha256sums_x86_64=('8208f8bdcf1aff8dbe39425fbf257348507ee5698e3a7b9852e4e7591c182633')
sha256sums_aarch64=('56cc981c858c39945d9907cf1375de97d9b17f5307383570a8236c6f8c88ddd6')

package() {
    install -Dm 755 ffmpeg ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffmpeg
    install -Dm 755 ffprobe ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffprobe
}
