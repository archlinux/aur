# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Benoît Allard <benoit.allard@gmx.de>

pkgname="dbt-core"
pkgver=1.8.5
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
b2sums=('0d0f91515bd5f96b18ced91cf1b21f08eb8b18a3ea233fb60ec2cda8ae7ea65de1ec6cd0db8022a99b8550af6bf3bdb969c0fab6ad1fa1efedcc01c355447bba')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation core
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" core/dist/*.whl
}
