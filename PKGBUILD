# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=1.0.0_rc2
pkgrel=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz")
sha256sums=('edf6c44f6f7a328cedd1fa43aab8c685f36d3320b59b57759f6f557e95485658')

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX="${pkgdir}"/usr ETC_PREFIX="${pkgdir}"/etc install
}

