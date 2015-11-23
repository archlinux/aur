# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=zget
pkgver=0.10
pkgrel=1
pkgdesc="Zeroconf based peer to peer file transfer"
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=('python' 'python-netifaces' 'python-progressbar2' 'python-requests' 'python-zeroconf')
source=("https://github.com/nils-werner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b72435578be80fe8eb5cd836a3e53550e5da88e987ddd3c04c2e3ac504cc770b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
