# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.3.1
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
source=("crazydiskmark-0.3.1.tar.gz::https://files.pythonhosted.org/packages/f4/4b/1de97b0b35745f541e95509b15d518d51e82c04dabbb1a781b5d8c114212/crazydiskmark-0.3.1.tar.gz")
sha256sums=(7c9f32162e4afd569bfb39c20ba1cf0e4c0d4686c67c6cb2683630d80de9be60)
build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
