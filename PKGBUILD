# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-input-libinput
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=1.5.0.1
pkgrel=1
pkgdesc="Official XLibre fork of X.Org generic input driver for the xorg server based on libinput"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libinput' 'glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'xorg-server-common<25.0.0.0' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('dd8151b3242de4e846e78c48bd60982cfcc9f9ab0d1f4f6bde36a25f2be2f8cc')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

