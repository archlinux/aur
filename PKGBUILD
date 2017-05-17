# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

_pkgname=gnome-shell-extension-bettervolume
pkgname=$_pkgname-git
pkgver=r38.1a66fab
pkgrel=1
pkgdesc="Allow better interaction with the volume indicator, via mouse scroll/middle-button."
arch=('i686' 'x86_64')
url="https://github.com/Tudmotu/$_pkgname"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  _uuid='bettervolume@tudmotu.com'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "convenience.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/convenience.js"

  install -Dm644 "LICENSE.rst" \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.rst"
}
