# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=gonhang
pkgver=0.1.4
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
source=("gonhang-0.1.4.tar.gz::https://files.pythonhosted.org/packages/a2/2d/6eca73201e8a867d67cf92e8f7ee2776224c987c76c591c40e8ca39428c2/gonhang-0.1.4.tar.gz")
sha256sums=(fa78117453fc5921bf86e4cda8ded15530d73dfbd795205744f72abb042a8f83)
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
