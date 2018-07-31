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

build() {
cd "$srcdir/$_pkgname"
git checkout dev
git submodule update
./build.sh
}

package() {
cd "$srcdir/$_pkgname"
sudo ./install.sh
}
