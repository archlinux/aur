# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'aarch64' 'i686')
license=('GPLv3')
depends=('yay')
provides=('pak')
conflicts=('pak')
#_arch="$(uname -m)"
source=("https://gitea.arsenm.dev/Arsen6331/pak/raw/branch/master/pak.toml")
source_x86_64=("https://minio.arsenm.dev/pak/$pkgver/pak-linux-x86_64")
source_i686=("https://minio.arsenm.dev/pak/$pkgver/pak-linux-386")
source_aarch64=("https://minio.arsenm.dev/pak/$pkgver/pak-linux-aarch64")
sha256sums=('fabc2ed995a9293db8636fdb5bef9de673d9f8b58341d7184ee8faf6bdcaab5a')
sha256sums_x86_64=('3829666922ac7669ce7cb18a751b50a70633f768dc5c78068ca4358ac317c963')
sha256sums_i686=('0f69740b7cef8d873ef8f7009861ede85a3f4529a04cea30bab977a243ce3045')
sha256sums_aarch64=('84c6e75c005ce4e8a85fc85db033272ef112657858f7930ae72f7d1c9ebf4721')
backup=('etc/pak.toml')

package() {
	mv pak-linux-* pak
	chmod +x pak
	install -Dm755 pak $pkgdir/usr/bin/pak
	sed -i 's/activeManager = ""/activeManager = "yay"/' pak.toml
	install -Dm755 pak.toml $pkgdir/etc/pak.toml
}
