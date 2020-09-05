# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.6.1
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
source=("crazydiskmark-0.6.1.tar.gz::https://files.pythonhosted.org/packages/16/d5/d1a5f14479e50803c3beb860fa9decddd305c0eda4b83f9c5942714b9419/crazydiskmark-0.6.1.tar.gz")
sha256sums=(4862b211651580df6b5f120073c2812aa77f1a42971a74acc7a2155ff5174617)
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
