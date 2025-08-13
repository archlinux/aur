# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-input-synaptics
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=1.10.0.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org Synaptics driver for notebook touchpads"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('libxtst' 'libevdev' 'libx11' 'libxi' 'glibc')
provides=($_pkgname $_pkgname_xf86 'synaptics')
conflicts=($_pkgname $_pkgname_xf86 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27' 'synaptics')
replaces=('synaptics')

sha256sums=('70ab6c2d3c7092e3789bf152fd7f0d9b373babe05178dd29d7b550fb27845213')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

