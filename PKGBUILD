# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-disable-unredirect-git
pkgver=r34.b2dcc0d
pkgrel=1
pkgdesc="Disables unredirect fullscreen windows in gnome-shell"
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect"
license=('GPL3')
depends=('gnome-shell')
conflicts=('gnome-shell-extension-disable-unredirect')
source=("git+https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect")
sha256sums=('SKIP')
_gitdir="gnome-shell-extension-disable-unredirect"

pkgver() {
  cd ${_gitdir}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitdir}/unredirect@vaina.lt"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/unredirect@vaina.lt/${i}"
  done
}
