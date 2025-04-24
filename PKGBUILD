# Maintainer: Charlie Menke <charliemenke[at]me[dot]com>

pkgname=snowflake-cli-bin
pkgver=3.7.0
pkgrel=1
epoch=1
pkgdesc='snowflake-cli (snow)'
arch=('x86_64')
url="https://github.com/snowflakedb/snowflake-cli"
license=('Apache-2.0')
depends=('gcc-libs'
    'xz')
source=("https://sfc-repo.snowflakecomputing.com/snowflake-cli/linux_${CARCH}/${pkgver}/snowflake-cli-${pkgver}.x86_64.deb")
sha256sums=('9f6880fcb8e65007a2fad0a05eeee6986b81e39a243efdf89c43361aac9ccad4')

package() {
  mkdir -p $pkgdir/snow
  bsdtar -C $pkgdir/snow -xf data.tar.gz
  install -Dm755 $pkgdir/snow/usr/lib/snowflake/snowflake-cli/snow $pkgdir/usr/bin/snow
  rm -rf ${pkgdir}/snow
}
