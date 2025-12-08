# Maintainer: artist for Xlibre <artist4xlibre@proton.me>

pkgname=xlibre-video-intel-bin
_pkgname=xlibre-video-intel
pkgver=3.0.0.6
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org Intel i810/i830/i915/945G/G965+ video drivers (binary release)"
arch=(x86_64)
url="https://x11libre.net"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libxvmc' 'pixman' 'xcb-util>=0.3.9'
         'libxcb' 'libxfixes' 'libxshmfence' 'libdrm' 'libxrender'
         'libx11' 'libxdamage' 'libxext' 'libpciaccess' 'glibc')
optdepends=('libxrandr: for intel-virtual-output'
            'libxinerama: for intel-virtual-output'
            'libxcursor: for intel-virtual-output'
            'libxtst: for intel-virtual-output'
            'libxss: for intel-virtual-output')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
provides=('xf86-video-intel' 'xlibre-video-intel' 'xf86-video-intel-uxa' 'xf86-video-intel-sna')
conflicts=('xf86-video-intel' 'xlibre-video-intel' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29'
           'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy')

sha256sums=('da4f9d7ed5f0aea3e992e93135c91f83d9792485d07c3411a13f813a646ac25b')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

