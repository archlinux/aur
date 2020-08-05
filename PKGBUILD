# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=autohide-battery
pkgname=gnome-shell-extension-${_pkgname}
pkgver=16
pkgrel=1
pkgdesc="GNOME Shell extension to hide battery icon, if battery is fully charged and AC is connected"
arch=('any')
url="https://github.com/ai/autohide-battery"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-autohide-battery-git')
install='gschemas.install'
source=(https://github.com/ai/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('ac4a8e39ef944d6a12261916b263eaee')


package() {
  cd "${_pkgname}-${pkgver}"

  local _uuid="autohide-battery@sitnik.ru"
  local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  find . -type f -name "*.js" -exec install -Dm 644 {} ${_destdir}/{} \;
  install -Dm 644 metadata.json ${_destdir};
}

# vim:set ts=2 sw=2 et:
