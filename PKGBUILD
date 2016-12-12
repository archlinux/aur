# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=zget
pkgver=0.11
pkgrel=2
pkgdesc="Zeroconf based peer to peer file transfer"
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=('python' 'python-netifaces<0.10.5' 'python-progressbar2' 'python-requests' 'python-zeroconf<0.17.6')
source=("https://github.com/nils-werner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d2c63fb391e14a2d93737213a15311a949fcfc32fee1a7f5aae95df3b0629b16')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
