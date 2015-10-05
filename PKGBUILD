# Maintainer: Colin Wallace <wallacoloo@gmail.com>

pkgname=gnome-shell-extension-nohotcorner-git
_gitname=nohotcorner
pkgver=11.0.r4.ge300475
pkgrel=1
pkgdesc="Gnome-shell extension disabling hotcorners"
arch=('any')
url="https://github.com/HROMANO/nohotcorner"
license=('GPLv2')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/HROMANO/nohotcorner.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _uuid='nohotcorner@azuri.free.fr'
  
  cd "$_gitname"
  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
}
