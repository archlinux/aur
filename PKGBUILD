# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=fontdoctools
pkgname=python-$_pipname
_sha=4c82c7711266
pkgver=1.2.2
pkgrel=3
pkgdesc='tools that help in documenting and reviewing the design or the engineering of fonts'
arch=(any)
_namespace=LindenbergSW
url="https://bitbucket.org/$_namespace/$_pipname"
license=(MIT)
_pydeps=(fonttools)
depends=(python
         "${_pydeps[@]/#/python-}")
provides=(dottedcircleshaper glyphplotter glyhpsandwich glyphshaper roentgen)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_namespace-$_pipname-$_sha"
source=("$_archive.zip::$url/get/$_sha.zip")
sha256sums=('7d52482e2610720602019ac723a5225a62f876d87a5f4a0f7489ed3ae0073bef')

build() {
    cd "$_archive"
    python -m build -wn
}

package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*.whl
}
