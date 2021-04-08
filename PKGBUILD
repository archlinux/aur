# Maintainer: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock
_pkgname=dash-to-dock
pkgver=69+430+gb08a568
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git')
_commit=b08a56814aa87cbc5726efa64ac79f0ed52bec3b
source=("git+https://github.com/ewlsh/dash-to-dock.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  git describe --tags | sed 's/^extensions\.gnome\.org-v//g' | sed 's/-/+/g' | sed 's/^56/69/g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}

# vim:set ts=2 sw=2 et:
