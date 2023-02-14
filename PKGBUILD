# Maintainer: Valerio Cupelloni <valerio dot cupelloni at gmail dot com>
pkgname=gnome-shell-extension-arrange-windows-git
pkgver=r49.0251cf1
pkgrel=1
pkgdesc="Arrange windows on the monitor."
arch=('any')
url="https://github.com/sunwxg/gnome-shell-extension-arrangeWindows"
license=('MIT')
depends=('gnome-shell>=3.26')
makedepends=('git')
provides=("gnome-shell-extension-arrange-windows-git")
source=('git+https://github.com/sunwxg/gnome-shell-extension-arrangeWindows')
sha256sums=('SKIP')

_reponame=gnome-shell-extension-arrangeWindows

package() {
  cd "$srcdir/$_reponame"
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "arrangeWindows@sun.wxg@gmail.com" "$pkgdir/usr/share/gnome-shell/extensions/arrangeWindows@sun.wxg@gmail.com"
}

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
