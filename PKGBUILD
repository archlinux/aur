# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=zget
pkgver=0.11.1
pkgrel=1
pkgdesc="Zeroconf based peer to peer file transfer"
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=('python' 'python-netifaces<0.10.5' 'python-progressbar2' 'python-requests' 'python-zeroconf<0.17.6')
source=("https://github.com/nils-werner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1a33fc926131e62fa7c5afa348e5da7529ddb0ec1cab6f06b15e3611a2960a4d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
