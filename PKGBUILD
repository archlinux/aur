# Maintainer: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock
_pkgname=dash-to-dock-extensions.gnome.org-v
pkgver=61
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext')
source=("https://github.com/micheleg/dash-to-dock/archive/extensions.gnome.org-v${pkgver}.tar.gz")
sha256sums=('8cea499749cca5cc0ae248a9ae5b1cda7e364526d5d1d90fd71f6aa886837c51')

build() {
  cd "${srcdir}"/${_pkgname}${pkgver}
  make
}

package() {
  cd "${srcdir}"/${_pkgname}${pkgver}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}

# vim:set ts=2 sw=2 et:
