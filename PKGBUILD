# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-dragonmapper
pkgver=0.2.6
pkgrel=1
pkgdesc='Identification and conversion functions for Chinese text processing'
arch=('any')
url="https://github.com/tsroten/dragonmapper"
license=('MIT')
depends=('python-jinja'
         'python-markupsafe'
         'python-pygments'
         'python-sphinx'
         'python-coverage'
         'flake8'
         'python-docutils'
         'python-mccabe'
         'python-pep8'
         'python-py'
         'python-pyflakes'
         'python-tox'
         'python-virtualenv'
         'python-hanzidentifier'
         'python-zhon')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsroten/dragonmapper/archive/v${pkgver}.tar.gz")
sha256sums=('77443bef7b31b00fed2861514ac59510bae87478237bab8bbe54aa1b79934f4a')

prepare() {
  cd "dragonmapper-${pkgver}"
  sed -i 's/==/>=/g' requirements.txt
}

package() {
  cd "dragonmapper-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}