# Maintainer: Bouteiller a2n Alan <a2n.dev at pm.me>

_plasmoidName="a2n.blur"
_sourcename="blurredwallpaper"
pkgname=plasma6-wallpapers-blurredwallpaper-git
pkgver=3.5.0
pkgrel=3
pkgdesc="KDE Plasma wallpaper plugin that blurs and/or dim the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_sourcename}"
license=(GPL-3.0-or-later)
makedepends=('git')
depends=('plasma-workspace')
provides=("$pkgname=$pkgver")
conflicts=('plasma6-wallpapers-blurredwallpaper')
source=("git+${url}.git")
md5sums=("SKIP")
validpgpkeys=(6A2ECC8A396F8A943A109A1E0F11C2A6BF79111E)

pkgver() {
  cd "${_sourcename}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_sourcename}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

