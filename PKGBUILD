# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-workspaces-bar-git
_pkgname=workspaces-bar
pkgver=r15.5983c75
pkgrel=1
pkgdesc="GNOME Shell extension that shows workspaces buttons in top panel"
arch=('any')
url="https://github.com/fthx/workspaces-bar"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/fthx/workspaces-bar.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  _uuid='workspaces-bar@fthx'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  cp -r $(ls -A | grep -vE '.git') \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
