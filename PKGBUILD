# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: willemw <willemw12@gmail.com>

pkgname='castero'
pkgver=0.8.2
pkgrel=2
pkgdesc='TUI podcast client for the terminal'
arch=('any')
url='https://github.com/xgi/castero'
_url_pypi='https://pypi.org/project/castero'
license=('MIT')
depends=('python-beautifulsoup4'
        'python-cjkwrap'
        'python-grequests'
        'python-lxml'
        'python-mpv'
        'python-vlc')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2dd0f33965e8d5908b3ad04660d810add538b579e9aa75c7237855a8193daf8e')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
