# Maintainer: acceleration3 <acceleration23 at gmail dot com>

pkgname=lsw-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Linux Subsystem for Windows: Windows applications as native windows, from a KVM guest with a paravirtual GPU"
arch=('x86_64')
url="https://github.com/acceleration3/linux-subsystem-windows"
license=('Apache-2.0' 'GPL-2.0-only' 'LGPL-2.1-or-later' 'Zlib' 'BSD-3-Clause'
         'GPL-3.0-only' 'LicenseRef-WinFsp-FLOSS-exception')
provides=('lsw')
conflicts=('lsw')
depends=(
    'qt6-base>=6.12' 'libvirt' 'libisofs' 'libvncserver' 'wimlib' 'hivex'
    'spdlog' 'fmt' 'zlib' 'wayland' 'libxkbcommon' 'libdrm'
    'vulkan-icd-loader' 'ocl-icd' 'libglvnd' 'libpipewire'
    'glib2' 'pixman' 'gnutls' 'libpng' 'libjpeg-turbo' 'libsasl' 'snappy' 'lzo'
    'zstd' 'numactl' 'keyutils' 'libslirp' 'libbpf'
    'libelf' 'libcbor' 'systemd-libs' 'libseccomp' 'dtc' 'pam' 'fuse3'
    'libaio' 'liburing' 'capstone' 'libusb'
    'glibc' 'libgcc' 'libstdc++'
    'vulkan-driver' 'edk2-ovmf' 'qemu-img' '7zip' 'curl'
    'hicolor-icon-theme'
    'sdl3'
)
optdepends=(
    'virtiofsd: shared folders between the host and the guest'
    'opencl-driver: OpenCL in the guest, run on the host GPU'
    'mesa: OpenGL in the guest on an AMD or Intel GPU (the host EGL driver)'
    'polkit: the one password prompt that lets a USB device be passed to the guest'
)
install=lsw-bin.install
options=('!strip' '!debug')
source=("https://github.com/acceleration3/linux-subsystem-windows/releases/download/v${pkgver}/lsw-${pkgver}-${CARCH}.tar.zst")
sha256sums=('e091f5ece29fb100a3a4cf95f620e18dbb7116a267dffcbc481eeed7dce24e8e')

package() {
    cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    mv "${pkgdir}/usr/share/licenses/lsw" "${pkgdir}/usr/share/licenses/${pkgname}"
}
