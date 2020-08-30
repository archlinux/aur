# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=crazydiskmark
pkgver=0.3.0
pkgrel=1
pkgdesc='Linux disk benchmark tool like CrystalDiskMark'
arch=('any')
url='https://github.com/fredcox/crazydiskmark'
license=('MIT')
depends=('python-pyqt5'
         'python-humanfriendly'
         'fio')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d9/43/389ec5e83d05d7f243396a7d74fa15f7258422e5cfc60148d67c08b829c3/crazydiskmark-${pkgver}.tar.gz"
        'LICENSE::https://github.com/fredcox/crazydiskmark/raw/master/LICENSE')
sha256sums=('513dea198732e0f2736ba7f947ec2b34407d7a8db58fc38609f3a4eebf4c757d'
            '6ad1a8e638684d561aa06d48bf6adc181f5893beb513460d9a664a1da43bd101')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
