# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha
pkgver=0.1.34
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
conflicts=('gonha-git')
depends=('python-pyqt5'
         'python-humanfriendly'
         'python-ewmh'
         'python-pathlib'
         'python-configobj'
         'python-colr'
         'python-pyinquirer'
         'ttf-fira-code'
         'python-prompt_toolkit1014')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/a7/0b/8890d405123107ead021b0f6df50d4723c91847e4df3a765b640310544cb/gonha-${pkgver}-py2.py3-none-any.whl"
        'LICENSE::https://github.com/fredcox/gonha/raw/master/LICENSE')
sha256sums=('260171b374baf3e14de13b225c9f5c28b9fa49b9459581af99b19dfcce84a5ac'
            '6ad1a8e638684d561aa06d48bf6adc181f5893beb513460d9a664a1da43bd101')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${pkgname}-${pkgver}-py2.py3-none-any.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -i "s|$srcdir||" "${pkgdir}/usr/lib/python3.8/site-packages/gonha-${pkgver}.dist-info/direct_url.json"
}
# vim:set ts=2 sw=2 et: