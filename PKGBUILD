# Maintainer: Maurice Frank <maurice.frank@posteo.de>

pkgname="python-musdb"
_pkgname=sigsep-mus-db
pkgver=0.4.2
pkgrel=1
pkgdesc="A python package to parse and process the MUSDB18 dataset"
arch=("x86_64")
url="https://github.com/sigsep/sigsep-mus-db"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-numpy1" "python-pyaml" "python-tqdm" "python-soundfile" "python-stempeg")

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sigsep/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("602bd6ea5a46df120f620d739a8971459c1afdea38dc87aa6b83b96828fb923a404a8751c6f781cafbf7f156757c55473269e86e697a6edb3bd25d1f7b72199f")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  depends=("python-numpy1" "python-pyaml" "python-tqdm" "python-soundfile" "python-stempeg")

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
