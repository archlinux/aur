# Maintainer: Victor "psygreg" Gregory <psygreg_at_pm_dot_me>
pkgname="wine-tkg-staging-ntsync-bin"
pkgver=10.11
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs (WOW64 with TkG-Staging and NTSYNC patches)"
url="https://github.com/Kron4ek/Wine-Builds"
license=('LGPL-2.1-or-later')
arch=('x86_64')
depends=(alsa-lib fontconfig freetype2 gettext gnutls gst-plugins-base-libs libpcap libpulse libxcomposite libxcursor libxi libxinerama libxkbcommon libxrandr opencl-icd-loader pcsclite sdl2 unixodbc v4l-utils wayland desktop-file-utils libgphoto2 glibc)
provides=(
  "wine=$pkgver"
  "wine-staging=$pkgver"
  "wine-wow64=$pkgver"
)
conflicts=("wine")
source=("https://github.com/Kron4ek/Wine-Builds/releases/download/${pkgver}/wine-${pkgver}-staging-tkg-ntsync-amd64-wow64.tar.xz")
sha256sums=('1bd50a198c4903afe7b41c4c873a8aaaeb78605fe58a409fd3c9cde6a9b8098b')

package() {

  ## Create usr binary directory
  mkdir -p ${pkgdir}/usr

  ## Install wine package
  cp -rf ${srcdir}/wine-${pkgver}-staging-tkg-ntsync-amd64-wow64/{bin,lib,share} ${pkgdir}/usr

}
