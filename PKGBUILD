# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=gonhang
pkgver=0.1.6
pkgrel=1
pkgdesc='GonhaNG is a System Monitor for several important hardware variables.'
arch=('any')
url='https://github.com/fredcox/gonhang'
license=('MIT')
depends=('python-pyqt5'
         'python-psutil'
         'python-humanfriendly'
         'curl'
         'wmctrl'
         'hddtemp'
         'python-requests')
makedepends=('python-setuptools')
source=("gonhang-0.1.6.tar.gz::https://files.pythonhosted.org/packages/d0/f9/a63625ddd78d3cafa4e5f8eb3dfa5a5ad6d265ce72bfe41a5bc4cd34154c/gonhang-0.1.6.tar.gz")
sha256sums=(398a58ab42c2c437a03b0fd15d3101169f65135fd4dc6e8b4bb50237c9c48979)
build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "${pkgname}"/"${pkgname}".desktop "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
  install -Dm644 "${pkgname}"/images/gonhang_icon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"


}
# vim:set ts=2 sw=2 et:
