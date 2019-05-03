# Maintainer: Victor <victor@xirion.net>
pkgname=batify-git
_pkgname=batify
_xpub=xpub
pkgver=1.0.r15.g691dc5b
pkgrel=1
pkgdesc='One udevrules file triggering plug and battery level notifications (multi-X sessions support).'
arch=('any')
url="https://github.com/Ventto/${_pkgname}.git"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libnotify' 'xpub')
optdepends=('notification-daemon')
source=("git+https://github.com/Ventto/${_pkgname}.git")

sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 99-${_pkgname}.rules ${pkgdir}/etc/udev/rules.d/99-${_pkgname}.rules
}
