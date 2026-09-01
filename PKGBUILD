# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=murmure-bin
pkgver=1.11.3
pkgrel=1
pkgdesc="Privacy-first speech-to-text, running entirely on your machine (precompiled binary)"
url="https://github.com/Kieirra/murmure"
arch=("x86_64")
depends=("gtk3" "libappindicator-gtk3" "webkit2gtk-4.1")
makedepends=("libarchive")
optdepends=("wl-clipboard: Wayland clipboard support" "gtk-layer-shell: Wayland overlay support")
provides=("murmure")
conflicts=("murmure")
options=("!strip")
license=("AGPL3")

source_x86_64=("murmure-${pkgver}-amd64.deb::${url}/releases/download/${pkgver}/Murmure_amd64.deb")
sha256sums_x86_64=('15ecc6cb3f85f203bdf7946dc6e06a5070c23657ad3d78dc84b7c4e51fc7a731')

package() {
  bsdtar -xOf "${srcdir}/murmure-${pkgver}-amd64.deb" data.tar.gz | bsdtar -xf - -C "${pkgdir}"
}

