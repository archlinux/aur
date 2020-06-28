# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=unsilence
pkgver=1.0.3
pkgrel=1
pkgdesc='Console Interface and Library to remove silent parts of a media file'
arch=('any')
url='https://github.com/lagmoellertim/unsilence'
license=('MIT')
depends=('ffmpeg' 'python-argparse' 'python-rich')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ac9ea5b5b5a8743133b4fd11fcc2b51418756e2d53530c71c0f663f44e24a56f')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
