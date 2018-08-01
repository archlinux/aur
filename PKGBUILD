pkgname=eagle-tunnel
pkgver=1.11.2
pkgrel=1
pkgdesc="Eagle Tunnel is a proxy application support both http(s) and socks5"
url="https://github.com/eaglexiang/eagle.tunnel.dotnet.core"
arch=('any')
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
source=('git+https://github.com/eaglexiang/eagle.tunnel.dotnet.core.git')
sha256sums=('SKIP')
backup=('etc/eagle-tunnel.conf' 'etc/eagle-tunnel-smart.conf')
install='eagle-tunnel.install'

prepare() {
cd eagle.tunnel.dotnet.core
git checkout -b dev origin/dev
git submodule init
git submodule update
}

build() {
cd eagle.tunnel.dotnet.core
./build.sh
}

package() {
cd eagle.tunnel.dotnet.core
./install.sh ${pkgdir}
}
