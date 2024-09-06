# Maintainer: SelfRef <arch@selfref.dev>

_basename=overlayed
pkgname=${_basename}-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="A modern, open-source, and free voice chat overlay for Discord (bin version)"
arch=('x86_64')
url="https://overlayed.dev"
license=('AGPL-3.0')
depends=('webkit2gtk' 'libayatana-appindicator')
makedepends=('git' 'pnpm' 'nvm' 'cargo')
optdepends=('discord: Needed for overlay to work')
provides=("$_basename")
conflicts=("$_basename")
source=("https://github.com/overlayeddev/overlayed/releases/download/v${pkgver}/overlayed_${pkgver}_amd64.deb")
sha256sums=('9a5d7057b184b164b4865c150dcb86afe1780ad7b1f2f78bd79db1c7f786bd44')

prepare() {
	tar -xvf data.tar.gz
}

package() {
	cp -r usr $pkgdir/
}
