# Maintainer: Jokler <jokler.contact@gmail.com>

pkgname=netdata-ts3-git
pkgver=38.ebf8101
pkgrel=1
pkgdesc="TS3 statistics for netdata"
arch=('i686' 'x86_64')
url="https://github.com/coraxx/netdata_ts3_plugin"
license=('MIT')
depends=('netdata')
makedepends=('git')
backup=(etc/netdata/python.d/ts3.conf)
source=("git+https://github.com/coraxx/netdata_ts3_plugin")
sha256sums=('SKIP')

pkgver() {
  cd "netdata_ts3_plugin"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "netdata_ts3_plugin"
  install -D -m644 ts3.chart.py "$pkgdir/usr/lib/netdata/python.d/ts3.chart.py"
  install -D -m644 -o netdata -g netdata ts3.conf "$pkgdir/etc/netdata/python.d/ts3.conf"
}
