# Maintainer: Kenneth Stier <kenny at trenta dot io>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-audio-output-switcher-git
pkgver=r7.4358343
pkgrel=2
pkgdesc="Adds a switch for choosing audio output to the system menu."
arch=('any')
url="https://github.com/adaxi/audio-output-switcher"
license=('BSD')
depends=('gnome-shell')
makedepends=('git')
source=("$pkgname::git+https://github.com/adaxi/audio-output-switcher")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _uuid='audio-output-switcher@anduchs'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
