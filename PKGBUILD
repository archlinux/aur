# Maintainer: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock
_pkgname=dash-to-dock-extensions.gnome.org-v
pkgver=63
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext')
source=("https://github.com/micheleg/dash-to-dock/archive/extensions.gnome.org-v${pkgver}.tar.gz")
sha256sums=('3705b043f7bcb02143a67161281277792fda58ddca11974e1416e5ead811ee3d')

build() {
  cd "${srcdir}"/${_pkgname}${pkgver}
  make
}

package() {
  cd "${srcdir}"/${_pkgname}${pkgver}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}

# vim:set ts=2 sw=2 et:
