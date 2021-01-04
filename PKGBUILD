# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'aarch64')
license=('GPLv3')
depends=('yay')
provides=('pak')
conflicts=('pak')
_arch="$(uname -m)"
source=("https://minio.arsenm.dev/pak/$pkgver/pak-linux-$_arch" "https://gitea.arsenm.dev/Arsen6331/pak/raw/branch/master/pak.toml")
md5sums=('SKIP' 'SKIP')

package() {
    chmod +x pak-linux-$_arch
	install -Dm755 pak-linux-$_arch $pkgdir/usr/bin/pak
	sed -i 's/activeManager = ""/activeManager = "yay"/' pak.toml
	install -Dm755 pak.toml $pkgdir/etc/pak.toml
}
