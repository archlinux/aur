# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-spacy-bin
_pkgname=html2image
pkgver=3.8.5
pkgrel=2
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

#They pulled this release from github so we'll pull from pypi
if [ "$pkgver" == "3.8.5" ]; then
  source=("https://files.pythonhosted.org/packages/dd/cf/5349e326ced174047e1e4124fac34f9dbe8206143f719bb15fa1ff25e88a/spacy-3.8.5-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
fi

md5sums=('0154e1931af078e50e5f4383ba2f5556')

package() {
  python -m installer --destdir="$pkgdir" "spacy-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
