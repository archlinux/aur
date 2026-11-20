# Maintainer: Benjamin Hesse <be[at]hesse[dot]im>
# Contributor: Charlie Menke <charliemenke[at]me[dot]com>

pkgname=snowflake-cli-bin
pkgver=3.34.0
pkgrel=1
epoch=1
pkgdesc='snowflake-cli (snow)'
arch=('x86_64')
url="https://github.com/snowflakedb/snowflake-cli"
license=('Apache-2.0')
depends=('gcc-libs'
    'xz')
source=("https://sfc-repo.snowflakecomputing.com/snowflake-cli/linux_${CARCH}/${pkgver}/snowflake-cli-${pkgver}.x86_64.deb")
sha256sums=('d7dfe7ce361361ca47a0fba7c58eb85985157cde2f64aa0a5161b90ef78a82ee')

package() {
  mkdir -p $pkgdir/snow
  bsdtar -C $pkgdir/snow -xf data.tar.gz
  install -Dm755 $pkgdir/snow/usr/lib/snowflake/snowflake-cli/snow $pkgdir/usr/bin/snow
  rm -rf ${pkgdir}/snow
}
