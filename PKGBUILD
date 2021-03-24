# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: willemw <willemw12@gmail.com>

pkgname='castero'
pkgver=0.9.1
pkgrel=1
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
sha256sums=('f6a37cf0102a0fe7b843dd0a38b86674b888eb7a494347d54f4823d41e558450')

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
