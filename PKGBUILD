# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Benoît Allard <benoit.allard@gmx.de>

pkgname="dbt-core"
pkgver=1.9.5
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
b2sums=('149cfdfd5b86d234c6cf4d324098505376eabf047db9c8796f140ec4a9b1db53dcc28f4f2f5021bd57958a1482f2ec6e17fb8ce19804ab008b67c75c018fd1fc')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation core
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" core/dist/*.whl
}
