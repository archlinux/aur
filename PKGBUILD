# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Benoît Allard <benoit.allard@gmx.de>

pkgname="dbt-core"
pkgver=1.9.2
pkgrel=1
pkgdesc="Tool for data analysts to build analytics the way engineers build applications"
arch=("any")
url="https://getdbt.com/"
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
b2sums=('f217ff2916d0afcd0601d4b13b5b89972071d2d77c337450a0dd3e10dca46d817a4afb6b7e83eda5972439a3bcd1a790a8d518f74878c7b3b97594c6fefd9ba1')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation core
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" core/dist/*.whl
}
