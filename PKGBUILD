# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=netbird-ui-bin
pkgver=0.64.1 # datasource=github-releases depName=netbirdio/netbird
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

sha256sums=('b30ed07d066c31a0f5e42bd1392a52aa64a4f71e55369291eed15662fc40d8ec'
            '2497362332dd3330c835e140549dd670f4097923a7000030dd30a443818055bc'
            '71b133636e91eb67f221f64592f64fa04a3b2337f4d616be36492efae0cff643')

package() {

	install -Dm644 "netbird.desktop" "$pkgdir/usr/share/applications/netbird.desktop"
	install -Dm644 "netbird.png" "$pkgdir/usr/share/pixmaps/netbird.png"
	install -Dm755 "netbird-ui" "$pkgdir/usr/bin/netbird-ui"

	local license_dir="$pkgdir/usr/share/licenses/$pkgname/"

	mkdir -p $license_dir
	cp -r LICENSE* $license_dir
}
