pkgname=eagle-tunnel
pkgver=1.11.2
pkgrel=1
pkgdesc="Eagle Tunnel is a proxy application support both http(s) and socks5"
url="https://github.com/eaglexiang/eagle.tunnel.dotnet.core"
arch=('any')
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
conflicts=()
replaces=()
backup=('etc/eagle-tunnel.conf' 'etc/eagle-tunnel-smart.conf')

prepare() {
git clone --recursive https://github.com/eaglexiang/eagle.tunnel.dotnet.core.git
cd eagle.tunnel.dotnet.core
git checkout dev
git pull
git submodule update
}

build() {
cd eagle.tunnel.dotnet.core
./build.sh
}

package() {
cd eagle.tunnel.dotnet.core
sudo ./install.sh
}
