# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock-gnome42-git
_pkgname=dash-to-dock
pkgver=72.r1387.5d26575
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock (GNOME 42 patches by 3v1n0)"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
conflicts=('gnome-shell-extension-dash-to-dock'
           'gnome-shell-extension-dash-to-dock-git'
           'gnome-shell-extension-dash-to-dock-gnome41-git')
source=("git+https://github.com/3v1n0/dash-to-dock.git#branch=locations-refactory")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  printf "72.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
