# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Fred Lins <fredcox at gmail dot com>
# install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
pkgname=crazydiskmark
pkgver=0.3.2
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
source=("crazydiskmark-0.3.2.tar.gz::https://files.pythonhosted.org/packages/9e/90/56632b2decde9cbc824b843139281196ce85fddcc055a852907b5cd7f8b3/crazydiskmark-0.3.2.tar.gz")
sha256sums=(ab0a7703f1ffd19888b6bb31b5dad1cc958e70ffefdf618d8aa6975387921008)
build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
