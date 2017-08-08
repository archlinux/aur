# Maintainer: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop
pkgver=0.5.1
pkgrel=1
pkgdesc="Workplace chat that improves your productivity."
url="https://www.zulip.org/"
arch=('x86_64')
license=('custom:"humbug-proprietary"')
depends=('qtwebkit' 'phonon-qt4' 'libjson')
source=('https://github.com/zulip/zulip-desktop/archive/0.5.1.tar.gz')
md5sums=('6da6eb36cfdbfa1453d269f5713173c5')
install=zulip-desktop.install

package() {
	install -m 755 -d "$pkgdir"/usr/{bin,share/licenses/"$pkgname"}
	cp -drn --no-preserve=mode -t "$pkgdir/usr/bin" "$srcdir/usr/bin/"*
	cp -drn --no-preserve=mode -t "$pkgdir/usr/share" "$srcdir/usr/share/"*
	cp -dn --no-preserve=mode "$srcdir/usr/share/doc/zulip-desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod 755 "$pkgdir/usr/bin/zulip"
}
