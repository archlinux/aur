# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=dockcheck
pkgver=0.7.4
pkgrel=1
pkgdesc="CLI tool to automate docker image updates. No pre-pull, selective, notify, prune."
arch=("any")
url="https://github.com/mag37/dockcheck"
license=("GPL-3.0-only")
depends=("bash" "regclient-regctl")
source=("https://github.com/mag37/dockcheck/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4955d2db666d2c85ac23e250a72bf1425a203bf7519a6f499924911c4ca60579')
package() {
	cd "$pkgname-$pkgver"
	install -D dockcheck.sh $pkgdir/usr/bin/$pkgname
	install -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -D notify_templates/notify*.sh -t $pkgdir/usr/share/$pkgname/
    # GPL licences are provided in the /usr/share/licenses/spdx:
    # https://wiki.archlinux.org/title/PKGBUILD#license
}
