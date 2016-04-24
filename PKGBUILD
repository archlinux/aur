# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=lastwake-git
pkgver=0.6.7eee207
pkgrel=1
pkgdesc="Wake/suspend time systemd journal analyzer"
arch=('any')
url="https://github.com/arigit/lastwake.py"
license=('unknown')
depends=('python-systemd')
makedepends=('git')
source=("${pkgname}::git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${pkgname}/lastwake.py" "${pkgdir}/usr/bin/lastwake"
}
