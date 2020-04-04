# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=1.0.1
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz")
sha256sums=('e90322435a979860f56b971c7d786d4fe3b5e7535a12ddd0d62386fab7d1a09d')

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX="${pkgdir}"/usr ETC_PREFIX="${pkgdir}"/etc install
}

