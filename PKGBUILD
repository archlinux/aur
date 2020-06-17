# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=2.0.2
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake' 'wayland-protocols')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz")
sha256sums=('3689ea2fbfac2fd015dca59accada8b55e67b97a8aa2618ec22871e27264960a')

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX=/usr WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES WITH_LAYERSHELL=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake DESTDIR="${pkgdir}" PREFIX=/usr ETC_PREFIX=/ install
}

