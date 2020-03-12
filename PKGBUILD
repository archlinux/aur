# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=tidal-dl
_pkgname=Tidal-Media-Downloader
pkgver=1.1.0.14
pkgrel=1
pkgdesc="Tidal Music Download"
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-requests' 'python-libffmpeg' 'python-pycryptodome' 'python-pydub')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8a38102c5a63ca65a518d41337e149b4ae852a6742a922168cccb78ba875a4cf')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/TIDALDL-PY"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/TIDALDL-PY"
  python setup.py install --root="$pkgdir/" --optimize=1
  # install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
