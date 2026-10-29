# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Benoît Allard <benoit.allard@gmx.de>

pkgname="dbt-core"
pkgver=2.0.8
pkgrel=1
pkgdesc="Tool for data analysts to build analytics the way engineers build applications"
arch=("any")
url="https://www.getdbt.com/"
license=("Apache")
makedepends=("python")
depends=(
         "python-agate"
         "python-betterproto-git"
         "python-click"
         "python-colorama"
         "python-dbt-extractor-git"
         "python-hologram"
         "python-isodate"
         "python-jinja"
         "python-logbook"
         "python-mashumaro"
         "python-minimal-snowplow-tracker"
         "python-networkx"
         "python-packaging"
         "python-pathspec"
         "python-protobuf"
         "python-psycopg2"
         "python-pytz"
         "python-pyyaml"
         "python-requests"
         "python-sqlparse"
         "python-typing_extensions"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbt-labs/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('bac2b52d7ca01d476cad49fc61cf425413201228a0eed79df7e1c8a44cb917fe738f0f36fc2539ca9e202fc6dd0c1669f1f384fa4878ad90e41934977fe919d5')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation core
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" core/dist/*.whl
}
