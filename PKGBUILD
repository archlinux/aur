# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=papermerge-core
pkgver=2.1.9
pkgrel=1
pkgdesc="Open Source Document Management System for Digital Archives (server)"
arch=(any)
url="https://github.com/papermerge/papermerge-core"
license=(Apache)
depends=(python-celery
         python-configula
         python-daphne
         python-django-celery-results
         python-django-cors-headers
         python-django-channels
         python-django-channels-redis
         python-django-dynamic-preferences
         python-django-filter
         python-django-haystack
         python-django-modelcluster
         python-django-rest-framework
         python-django-rest-framework-json-api
         python-django-rest-knox
         python-django-taggit
         python-drf-spectacular
         python-drf-spectacular-sidecar
         python-elasticsearch
         python-lxml
         python-magic
         python-ocrmypdf-papermerge
         python-pdf2image
         python-persisting-theory
         python-psycopg2
         python-redis
         python-uritemplate
         python-whoosh
         python-xapian-haystack
         python-yaml
         uwsgi-plugin-python)
makedepends=(python-build python-installer python-wheel python-poetry-core python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('44581e2346f2216aec4e9fc333d599e9748b57f872c61b3b2cf868d5df45defc')


build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
