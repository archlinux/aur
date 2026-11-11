# Maintainer: Witold Adamus <wit3k@users.noreply.gitlab.gnome.org>
#
# Binary AUR package: prebuilt /usr install tree from GitLab Generic Packages
# (uploaded by the tag `release-dist` CI job).
# Artifact name: routine-<pkgver>-x86_64.tar.zst
#
# After each upstream tag: bump pkgver, refresh sha256sums, makepkg --printsrcinfo.
# If publishing under `routine-gnome-bin`, rename pkgname and adjust conflicts/provides.

pkgname=routine-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='GNOME time-blocking client with local routine-server (prebuilt)'
url='https://gitlab.gnome.org/wit3k/routine'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'hicolor-icon-theme'
  'dbus'
)
provides=('routine')
conflicts=('routine')
install=routine-bin.install
# Project path URL-encoded: wit3k/routine
_gl_api='https://gitlab.gnome.org/api/v4/projects/wit3k%2Froutine/packages/generic/routine'
source=(
  "routine-${pkgver}-x86_64.tar.zst::${_gl_api}/${pkgver}/routine-${pkgver}-x86_64.tar.zst"
)
sha256sums=('b62994ced784ef33af7b97436e780e273f388d11838a0cacc797bf1d97a08707')

package() {
  cp -a "$srcdir"/usr "$pkgdir"/
}

# vim: set ts=2 sw=2 et:
