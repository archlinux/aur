# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=gonhang
pkgver=0.1.5
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
source=("gonhang-0.1.5.tar.gz::https://files.pythonhosted.org/packages/84/03/8b98356576c01579150b194bf3f16fc5af7129f70b9d10e4b73d9e9d77ea/gonhang-0.1.5.tar.gz")
sha256sums=(11561858a51c1b51767c10ffe0e29416ab40618cd48838b3bd5d17c2ea08e061)
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
