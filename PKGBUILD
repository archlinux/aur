# Maintainer: Bastien "neitsab" Traverse <neitsab at archlinux dot org>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname="lumi-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A Desktop App that offers a collection of tools to create, edit and share digital content with your class."
arch=('x86_64' 'aarch64')
url="https://${pkgname%-bin}.education"     
_url="https://github.com/Lumieducation/Lumi"
license=('GPL-3.0-or-later')
depends=('gtk3' 'electron34' 'ffmpeg' 'http-parser' 'libxss' 're2' 'libnotify')
optdepends=('libappindicator-gtk3')
provides=('lumi')
conflicts=('lumi')
options=('!emptydirs')
source_x86_64=("${pkgname%-bin}-x86_64-${pkgver}.pacman::${_url}/releases/download/v${pkgver}/lumi-${pkgver}.pacman")
source_aarch64=("${pkgname%-bin}-aarch64-${pkgver}.pacman::${_url}/releases/download/v${pkgver}/lumi-${pkgver}-aarch64.pacman")
sha256sums_x86_64=('c146566e103f57f6f06ffa4912f88d65b0548c161fd9aebd8d60032a3c324bd3')
sha256sums_aarch64=('100d3853cf90757607c2c92334597e81181cb97666484a17619775ab7c575e3d')

package() {
	install -d "${pkgdir}/{opt,usr}"
	cp -R "${srcdir}/opt/"  "${pkgdir}/opt/"
	cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
