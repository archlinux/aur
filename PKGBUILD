# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-spacy-bin
_pkgname=spacy
pkgver=3.8.7
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
  'python-weasel'
)

_cpy='cp313'
_glibc='2_17'
_url="https://files.pythonhosted.org/packages/${_cpy}/${_pkgname::1}/${_pkgname}"
_filename="${_pkgname}-${pkgver}-${_cpy}-${_cpy}-manylinux_${_glibc}_${CARCH}.manylinux2014_${CARCH}.whl"
source=("${_url}/${_filename}")
md5sums=('bfc5ec2001b0bdda648cd387f475622b')

package() {
  python -m installer --destdir="$pkgdir" $_filename
  install -Dm644 spacy-${pkgver}.dist-info/licenses/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
