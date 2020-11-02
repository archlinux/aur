# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=unsilence
pkgver=1.0.6
pkgrel=1
pkgdesc='Console Interface and Library to remove silent parts of a media file'
arch=('any')
url='https://github.com/lagmoellertim/unsilence'
license=('MIT')
depends=('ffmpeg' 'python' 'python-argparse' 'python-rich')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('176a2b26922ddc12f0d4c5c8a2bd6f0cebd9e319eb9ea55ef184ceb48401642d')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  rm -r "${pkgdir}/usr/lib/python"*'/site-packages/examples'
}

# vim: ts=2 sw=2 et:
