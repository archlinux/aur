# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='favfreak'
pkgname="${_pkgname}-git"
pkgver=1.0.r9.g8f19690
pkgrel=1
pkgdesc='Making Favicon.ico based Recon Great again'
arch=('any')
url='https://github.com/devanshbatham/FavFreak'
license=('MIT')
depends=('python-mmh3')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
