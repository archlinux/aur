# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha
pkgver=0.1.18
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
depends=('python-pyqt5'
         'python-humanfriendly'
         'python-ewmh'
         'python-pathlib'
         'python-configobj'
         'python-colr'
         'python-pyinquirer'
         'ttf-fira-code')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/c9/03/9fe234784d6c272eb409557dfe2a871e6e7b5d1a00fef071e726270164de/gonha-${pkgver}-py2.py3-none-any.whl"
        'LICENSE::https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('ec7d05eb1f5f3809d462e3385ca866b6db40d5d34999215678f2b623c5509f3c'
            '6ad1a8e638684d561aa06d48bf6adc181f5893beb513460d9a664a1da43bd101')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${pkgname}-${pkgver}-py2.py3-none-any.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -i "s|$srcdir||" "${pkgdir}/usr/lib/python3.8/site-packages/gonha-0.1.18.dist-info/direct_url.json"
}
# vim:set ts=2 sw=2 et: