# Maintainer: Roberto Ramirez (jobeto86) <https://github.com/jobeto86>

pkgname=electron39-v3-bin
pkgver=39.5.2
pkgrel=1
pkgdesc='Electron 39 optimized for x86-64-v3 with glibc 2.43 fix (prebuilt binary)'
arch=('x86_64')
url='https://github.com/jobeto86/electron39-v3-cachyos'
license=('MIT' 'BSD-3-Clause')
provides=("electron39=${pkgver}")
conflicts=('electron39')
depends=('c-ares'
         'gcc-libs'
         'glibc'
         'gtk3'
         'libevent'
         'libffi'
         'libpulse'
         'nss'
         'zlib')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop default')
options=('!strip')
# Download the pre-built pacman package from GitHub Releases
source=("https://github.com/jobeto86/electron39-v3-cachyos/releases/download/v${pkgver}-v3/electron39-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')
noextract=("electron39-${pkgver}-1-x86_64.pkg.tar.zst")

package() {
  # Extract the pre-built package contents into pkgdir
  bsdtar -xf "${srcdir}/electron39-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.PKGINFO' --exclude='.BUILDINFO' --exclude='.MTREE'
}
