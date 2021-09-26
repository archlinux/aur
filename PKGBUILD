# Maintainer: Dzmitry Neviadomski <nevack dot d at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock-gnome41-git
_pkgname=dash-to-dock
pkgver=69+101+gcd5d7c4
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
conflicts=('gnome-shell-extension-dash-to-dock')
provides=('gnome-shell-extension-dash-to-dock')
_commit=cd5d7c45ef7249d70337e22e5fa81e6e6fe9d470
source=("git+https://github.com/frantisekz/dash-to-dock.git#commit=$_commit")
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
