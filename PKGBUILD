# Contributor: Anatol Pomozov
# Maintainer: tee < teeaur at duck dot com >

pkgname=osquery-bin
pkgver=5.24.1
pkgrel=1
pkgdesc='SQL powered operating system instrumentation, monitoring, and analytics(upstream binary)'
arch=(x86_64)
url='https://osquery.io'
license=('Apache-2.0 OR GPL-2.0-or-later')
depends=(bash glibc)
provides=(osquery)
conflicts=(osquery)
#source=("https://pkg.osquery.io/linux/osquery-${pkgver}_1.linux_$arch.tar.gz")
#source=("https://pkg.osquery.io/deb/osquery_${pkgver}-1.linux_amd64.deb")
source=("https://github.com/osquery/osquery/releases/download/$pkgver/osquery_$pkgver-1.linux_amd64.deb")
b2sums=('e5a68774f3b3fd79ac2e2d9dd8e4a5b5e83b38cd4ef4dd923f038731484b38ebdcabfb54422c7a3d027ae9223e1827f3cd478702647c20c7933e23b3515f503e')

package() {
  tar -xf data.tar.gz -C "$pkgdir" --exclude /etc/init.d/osqueryd --exclude /etc/init.d
}
