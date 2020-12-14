# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='headset-charge-indicator'
pkgname="${_pkgname}-git"
pkgver=1.0.0.0.r33.g795705a
pkgrel=1
pkgdesc='Simple app-indicator for GNOME desktops to display the battery charge of some wireless headsets'
arch=('any')
url='https://github.com/centic9/headset-charge-indicator'
license=('BSD')
depends=('gnome-icon-theme' 'headsetcontrol' 'libappindicator-gtk3' 'python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
