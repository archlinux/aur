_basename=radeon-profile-daemon
pkgname=${_basename}-runit
pkgver=20201030
pkgrel=1
pkgdesc="runit service scripts for ${_basename}"
arch=('any')
url="https://artixlinux.org"
license=('BSD')
# Note: While this PKGBUILD is licensed under BSD-3 terms, all of the
#       included runscript should follow it's main package's licenses.
depends=("${_basename}")
conflicts=('systemd-sysvcompat')
source=("${_basename}.run")
sha256sums=('423464fb0e6dc84e0be31bcfef7d6e71496ee8071cd123894b290e908e3460d2')

package() {
  install -Dm755 "$srcdir/${_basename}.run" "$pkgdir/etc/runit/sv/${_basename}/run"
}
