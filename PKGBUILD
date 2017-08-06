# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=zget
pkgver=0.11.1
pkgrel=2
pkgdesc="Zeroconf based peer to peer file transfer"
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=('python' 'python-netifaces' 'python-progressbar' 'python-requests' 'python-zeroconf')
makedepends=('python-setuptools')
source=("https://github.com/nils-werner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1a33fc926131e62fa7c5afa348e5da7529ddb0ec1cab6f06b15e3611a2960a4d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Remove unneeded limitations (on Arch)
  sed -i 's/<......//' setup.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
