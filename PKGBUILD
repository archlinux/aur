# Maintainer: Jonne Haß <me@mrzyx.de>

pkgname=gnome-shell-extension-cpu-freq-git
_gitname=gnome-shell-extension-cpu-freq
pkgver=26.7f11a60
pkgrel=1
pkgdesc="View the actual frequency and change CPU frequency governor from gnome shell."
arch=('any')
url="https://github.com/nodefourtytwo/gnome-shell-extension-cpu-freq"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/nodefourtytwo/gnome-shell-extension-cpu-freq.git')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $_gitname
  _extid='cpufreq@nodefourtytwo.net'
  install -Dm644 extension.js   "$pkgdir/usr/share/gnome-shell/extensions/$_extid/extension.js"
  install -Dm644 metadata.json  "$pkgdir/usr/share/gnome-shell/extensions/$_extid/metadata.json"
}
sha256sums=('SKIP')
