# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=netbird-ui-bin
pkgver=0.59.7 # datasource=github-releases depName=netbirdio/netbird
pkgrel=1
pkgdesc='Official GUI for the Netbird client'
arch=('x86_64')
url='https://netbird.io'
license=('BSD-3-Clause AND AGPL-3.0-only')
provides=('netbird-ui')

depends=(
	'glibc'
	'libglvnd'
	'libx11'
	'netbird'
)

source=(
	"https://github.com/netbirdio/netbird/releases/download/v${pkgver}/netbird-ui-linux_${pkgver}_linux_amd64.tar.gz"
	"netbird.desktop"
	"netbird.png"
)

sha256sums=('0a294356e012059fad569b0a02cc5bec616fb38a659685c267dada6de6de2b10'
            '48e798009153a1c11ff1f5e250056aedb93c6e40df0c9a33f8b9e5d739462982'
            '71b133636e91eb67f221f64592f64fa04a3b2337f4d616be36492efae0cff643')

package() {

	install -Dm644 "netbird.desktop" "$pkgdir/usr/share/applications/netbird.desktop"
	install -Dm644 "netbird.png" "$pkgdir/usr/share/pixmaps/netbird.png"
	install -Dm755 "netbird-ui" "$pkgdir/usr/bin/netbird-ui"

	local license_dir="$pkgdir/usr/share/licenses/$pkgname/"

	mkdir -p $license_dir
	cp -r LICENSE* $license_dir
}
