# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-input-void
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=1.4.2.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org void input driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('custom')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')

sha256sums=('24f3dc590f78f11998490f75a67055e47d2a3a95dd9ab3107053f77be3e0a826')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

