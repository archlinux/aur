# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.4.2
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
source=("crazydiskmark-0.4.2.tar.gz::https://files.pythonhosted.org/packages/4f/53/c9cebcbc89962a1f65020e76dc844f5dc22a7e23f7c4dba9b27c9fefbb45/crazydiskmark-0.4.2.tar.gz")
sha256sums=(47c5eeac95025ded4703f833a933179c731d3fcf280ef81b8fbd333696de9c51)
build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
