# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-spacy-bin
_pkgname=spacy
pkgver=3.8.4
pkgrel=1
epoch=1
pkgdesc="Industrial-strength Natural Language Processing (NLP) in Python"
arch=('x86_64')
url="https://github.com/explosion/spaCy"
license=('MIT')
provides=(python-spacy)
conflicts=(python-spacy)
depends=(
  'python-catalogue'
  'python-cymem'
  'python-jinja'
  'python-langcodes'
  'python-murmurhash'
  'python-numpy'
  'python-preshed'
  'python-pydantic'
  'python-requests'
  'python-smart_open'
  'python-spacy-loggers'
  'python-srsly'
  'python-thinc'
  'python-tqdm'
  'python-typer'
  'python-wasabi'
  'python-weasel')
source=("https://github.com/explosion/spaCy/releases/download/release-v${pkgver}/spacy-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
_cpy='cp312'
_glibc='2_17'
_url="https://files.pythonhosted.org/packages/${_cpy}/${_pkgname::1}/${_pkgname}"
_filename="${_pkgname}-${pkgver}-${_cpy}-${_cpy}-manylinux_2_17_${CARCH}.manylinux2014_${CARCH}.whl"
source=("${_url}/${_filename}")

md5sums=('6d54fb4a11753224c5de5927716ac376')

package() {
  python -m installer --destdir="$pkgdir" "spacy-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
  install -Dm644 spacy-${pkgver}.dist-info/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
