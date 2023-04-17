# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='lutris-wine-git'
pkgver='0.77.2.r0.g86bae7c'
pkgrel='1'
pkgdesc='Easy launch of your Windows applications and games with Wine/Proton'
arch=('x86_64')
url='https://github.com/VHSgunzo/lutris-wine'
license=('MIT')
depends=('aria2' 'qt5-tools' 'xterm' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
         'xorg-fonts-cyrillic' 'xorg-fonts-type1' 'xorg-fonts-misc' 'cabextract'
         'perl' 'unzip' 'xorg-xmessage' 'zenity' 'yad' 'xkb-switch' 'imagemagick'
         'icoutils' 'lib32-vkbasalt' 'mangohud-lw-git'
         'vkbasalt' 'gamemode' 'lib32-gamemode' 'giflib' 'lib32-giflib' 'libpng'
         'lib32-libpng' 'libldap' 'lib32-libldap' 'gnutls' 'lib32-gnutls'
         'mpg123' 'lib32-mpg123' 'openal' 'lib32-openal' 'v4l-utils' 'lib32-v4l-utils'
         'libpulse' 'lib32-libpulse' 'libgpg-error' 'lib32-libgpg-error'
         'alsa-plugins' 'lib32-alsa-plugins' 'alsa-lib' 'lib32-alsa-lib'
         'libjpeg-turbo' 'lib32-libjpeg-turbo' 'sqlite' 'lib32-sqlite' 'libxcomposite'
         'lib32-libxcomposite' 'libxinerama' 'lib32-libgcrypt' 'libgcrypt'
         'lib32-libxinerama' 'ncurses' 'lib32-ncurses' 'opencl-icd-loader'
         'lib32-opencl-icd-loader' 'libxslt' 'lib32-libxslt' 'libva' 'lib32-libva'
         'gtk3' 'lib32-gtk3' 'lib32-vulkan-icd-loader' 'vulkan-headers' 'vulkan-icd-loader'
         'vulkan-tools' 'mesa' 'lib32-glu' 'glu' 'lib32-libva-mesa-driver' 'lib32-mesa'
         'libva-mesa-driver' 'mesa-demos' 'mesa-utils' 'mesa-vdpau' 'vulkan-mesa-layers'
         'lib32-vulkan-mesa-layers' 'libstrangle-git' 'openssl' 'libnotify' 'coreutils'
         'libxrandr' 'lib32-libxrandr' 'xorg-xrandr' 'bc' 'xorg-xgamma' 'lsb-release'
         'iputils' 'curl' 'xdelta3' 'xdg-utils' 'lsvkdev'
         'desktop-file-utils' 'squashfs-tools' 'squashfuse' 'fuse2' 'reshade-shaders-git'
         'winetricks-git' 'innoextract' 'p7zip' 'gnu-netcat' 'xdg-user-dirs'
)
makedepends=('git')
optdepends=('lib32-vulkan-radeon' 'vulkan-radeon' 'xf86-video-amdgpu'
            'lib32-vulkan-intel' 'vulkan-intel' 'lib32-libva-intel-driver'
            'libva-intel-driver' 'libva-utils' 'xf86-video-intel' 'lib32-nvidia-utils'
            'lib32-opencl-nvidia' 'lib32-libxnvctrl' 'libxnvctrl' 'nvidia' 'nvidia-dkms'
            'nvidia-settings' 'nvidia-utils' 'opencl-nvidia' 'linux-zen' 'linux-zen-headers'
            'vulkan-swrast' 'llvm' 'lib32-llvm' 'wine' 'latencyflex-git' 'latencyflex-wine-git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/VHSgunzo/lutris-wine.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/${pkgname}
    make DESTDIR="${pkgdir}" install
}
