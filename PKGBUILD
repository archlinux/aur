# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=2.0.4
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake' 'wayland-protocols')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz")
sha256sums=('3f8648c69867fdbe83c09a1a10d9c3be813803f66721bc4543c49a525fed5c39')

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX=/usr WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES WITH_LAYERSHELL=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake DESTDIR="${pkgdir}" PREFIX=/usr ETC_PREFIX=/ install
}

