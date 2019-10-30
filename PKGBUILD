# Maintainer: Maurice Frank <maurice.frank@posteo.de>

pkgbase=python-musdb
pkgname="python-musdb"
_pkgname=sigsep-mus-db
pkgver=0.3.1
pkgrel=1
pkgdesc="A python package to parse and process the MUSDB18 dataset"
arch=("x86_64")
url="https://github.com/sigsep/sigsep-mus-db"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-numpy" "python-pyaml" "python-tqdm" "python-soundfile" "python-stempeg")

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sigsep/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("111de5b65c36af0ba31cfd188cf8fa563888db3a62865a6c48a686db763d8a54334f4521a709872ef4c86632480a73e8ba8c5b9706f528873462d7ceeb2e2b09")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-musdb() {
  depends=("python-numpy" "python-pyaml" "python-tqdm" "python-soundfile" "python-stempeg")

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
