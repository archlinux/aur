# Maintainer: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop
pkgver=0.4.4
pkgrel=1
pkgdesc="Workplace chat that improves your productivity."
url="http://www.zulip.com/apps"
arch=('x86_64')
license=('custom:"humbug-proprietary"')
depends=('qtwebkit' 'phonon-qt4')
source=('https://zulip.com/dist/apps/linux/zulip-desktop_latest.bin.tar.gz')
md5sums=('4067e28d5954ef0b10ebc16e55ac9dc8')
install=zulip-desktop.install

package() {
	install -m 755 -d "$pkgdir"/usr/{bin,share/licenses/"$pkgname"}
	cp -drn --no-preserve=mode -t "$pkgdir/usr/bin" "$srcdir/usr/bin/"*
	cp -drn --no-preserve=mode -t "$pkgdir/usr/share" "$srcdir/usr/share/"*
	cp -dn --no-preserve=mode "$srcdir/usr/share/doc/zulip-desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod 755 "$pkgdir/usr/bin/zulip"
}
