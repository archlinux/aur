# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.5.5
pkgrel=1
pkgdesc='Linux disk benchmark tool like CrystalDiskMark'
arch=('any')
url='https://github.com/fredcox/crazydiskmark'
license=('MIT')
depends=('python-pyqt5'
         'python-coloredlogs'
         'python-humanfriendly'
         'fio')
makedepends=('python-setuptools')
source=("crazydiskmark-0.5.5.tar.gz::https://files.pythonhosted.org/packages/dc/da/281172b44e913438c43b64b96163e3ac7b65de1843d7ed22bb24ba5d669b/crazydiskmark-0.5.5.tar.gz")
sha256sums=(974527cc8c044302fc17e5877f29efbd5240f89a875c7a16a2eeae8347bd30fa)
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
  install -Dm644 "${pkgname}"/images/crazydiskmark_icon.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"


}
# vim:set ts=2 sw=2 et:
