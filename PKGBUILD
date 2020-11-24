# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_name='SecretFinder'
_pkgname="${_name,,}"
pkgname="${_pkgname}-git"
pkgver=r39.ca5e1a1
pkgrel=1
pkgdesc='Find sensitive data (apikeys, accesstoken,jwt,..) and search anything on javascript files'
arch=('any')
url='https://github.com/m4ll0k/SecretFinder'
license=('GPL3')
depends=('python-argparse' 'python-jsbeautifier' 'python-lxml' 'python-requests-file')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_name}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
