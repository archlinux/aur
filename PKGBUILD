pkgname=unikey-wayland-bin
pkgver=2.0.10
pkgrel=1
pkgdesc="Unikey Wayland Input Method for Vietnamese (Prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu2310fake/Unikey-Wayland"
license=('GPL3')
depends=('qt6-base' 'wayland' 'ibus' 'libxkbcommon' 'libx11' 'libxtst')
provides=('unikey-wayland')
conflicts=('unikey-wayland')
source_x86_64=("unikey-wayland-x86_64.pkg.tar.zst::https://github.com/ubuntu2310fake/Unikey-Wayland/releases/download/${pkgver}/unikey-wayland-${pkgver}-1-x86_64.pkg.tar.zst")
source_aarch64=("unikey-wayland-aarch64.pkg.tar.zst::https://github.com/ubuntu2310fake/Unikey-Wayland/releases/download/${pkgver}/unikey-wayland-${pkgver}-1-aarch64.pkg.tar.zst")
noextract=('unikey-wayland-x86_64.pkg.tar.zst' 'unikey-wayland-aarch64.pkg.tar.zst')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  if [ "$CARCH" = "x86_64" ]; then
      bsdtar -xf "${srcdir}/unikey-wayland-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
  elif [ "$CARCH" = "aarch64" ]; then
      bsdtar -xf "${srcdir}/unikey-wayland-aarch64.pkg.tar.zst" -C "${pkgdir}" usr
  fi
}
