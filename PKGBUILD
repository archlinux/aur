# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=gonhang
pkgver=0.1.8
pkgrel=1
pkgdesc='GonhaNG is a System Monitor for several important hardware variables.'
arch=('any')
url='https://github.com/fredcox/gonhang'
license=('MIT')
depends=('python-pyqt5'
         'python-psutil'
         'python-humanfriendly'
         'curl'
         'ttf-fira-code'
         'wmctrl'
         'hddtemp'
         'python-requests')
makedepends=('python-setuptools')
source=("gonhang-0.1.8.tar.gz::https://files.pythonhosted.org/packages/75/db/6af1b5dd96dcb6c8958c8466ec82fdecfa086a091d67fc0222abc4ea69ff/gonhang-0.1.8.tar.gz")
sha256sums=(eb9a1615de4aee2cc8c0ee986d8a2074035c8abf11e7743575edb7b99c417a2f)
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
