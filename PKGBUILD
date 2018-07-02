# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=ddos-deflate
pkgver=v0.9.r13.g1b18e29
pkgrel=1
pkgdesc="Lightweight bash shell script designed to assist in the process of blocking a denial of service attack"
arch=('any')
url="https://github.com/jgmdev/ddos-deflate/"
license=('Artistic')
depends=(
  'iptables'
  'net-tools'
  'sed'
  'gawk'
  'grep'
  'coreutils'
  'bind-tools'
  'dsniff'
  'bash'
)
backup=(
  'etc/ddos/ddos.conf'
  'etc/ddos/ignore.ip.list'
  'etc/ddos/ignore.host.list'
)
source=(
  "git://github.com/jgmdev/ddos-deflate"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"/$pkgname

  DESTDIR="$pkgdir" ./install.sh
}
