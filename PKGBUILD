# Maintainer: ArcanusNEO <admin@transcliff.top>
_pkgname=gnome-shell-extension-windowisready_remover
pkgname=$_pkgname-git
pkgver=r35.f8bfd6f
pkgrel=1
pkgdesc='GNOME shell extension that removes the annoying "Windows is Ready" notification.'
arch=("any")
url="https://github.com/nunofarruca/WindowIsReady_Remover"
license=("Apache-2.0")
depends=("gnome-shell")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
b2sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  local _uuid="windowIsReady_Remover@nunofarruca@gmail.com"
  find ${_uuid} -regextype posix-egrep -regex ".*\.(js|json)$" -exec install -Dm644 {} ${pkgdir}/usr/share/gnome-shell/extensions/{} \;
}
