# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

_repo="voxel51/fiftyone"
_source_type=github-tags
_upstreamver='v0.18.0'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="An open source toolkit for building datasets and computer vision models"
arch=(x86_64)
url=https://github.com/$_repo
depends=(
  # NOTE: Some "common" dependencies are marked "missing" since the AUR packages don't exist yet.
  ffmpeg
  mongodb
  python-aiofiles
  python-argcomplete
  python-boto3
  python-dacite
  python-deprecated
  python-eventlet
  python-flask
  python-httpx
  python-hypercorn  # missing
  python-jinja
  python-kaleido  # missing
  python-matplotlib
  python-mongoengine
  python-motor
  python-ndjson  # missing
  python-packaging
  python-pandas
  python-plotly
  python-pprintpp
  python-psutil
  python-pymongo
  python-pytz
  python-yaml
  python-retrying
  python-scikit-learn
  python-scikit-image
  python-setuptools
  python-sseclient-py  # missing
  python-sse-starlette
  python-starlette
  python-strawberry-graphql  # missing
  python-tabulate
  python-universal-analytics-python3  # missing
  python-voxel51-eta  # missing
  python-xmltodict
)
makedepends=(
  python-setuptools
)
license=("Apache-2.0")
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/${_pkgname}-$pkgver" || return 1
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
