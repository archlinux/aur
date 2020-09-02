# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.3.5
pkgrel=1
pkgdesc='Linux disk benchmark tool like CrystalDiskMark'
arch=('any')
url='https://github.com/fredcox/crazydiskmark'
license=('MIT')
depends=('python-pyqt5'
         'python-coloredlogs'
         'python-distro'
         'python-humanfriendly'
         'python-desktop-file'
         'fio')
makedepends=('python-setuptools')
source=("crazydiskmark-0.3.5.tar.gz::https://files.pythonhosted.org/packages/a8/bb/6dfaea238a9b2e178fd9891e4c4c4382dee44bc05a94e1aeaef7f144aa11/crazydiskmark-0.3.5.tar.gz")
sha256sums=(bdadeacd9dd5f514e72f9138022e04813aac575a212be228f5a814ac3518789e)
build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
