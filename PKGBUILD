# Maintainer: Gore Liu <goreliu@126.com>

pkgname=docker-systemctl-replacement-git
_pkgname=docker-systemctl-replacement
pkgver=1159.5103149
pkgrel=1
pkgdesc="docker systemctl replacement"
url='https://github.com/gdraheim/docker-systemctl-replacement'
arch=('any')
license=('GPL')
depends=('python')
source=("${_pkgname}::git+https://github.com/gdraheim/docker-systemctl-replacement")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "files/docker/systemctl.py" "${pkgdir}/usr/bin/systemctl.py"
}
