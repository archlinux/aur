# Maintainer: stef204 <stef204 AT [*] (where[*]=yandex DOT com)>
pkgbase=masshash
pkgname=('masshash' 'masshash-launcher')
pkgver=1.0.1
pkgrel=1
pkgdesc="A set of file hashing tools (cli & gtk+ gui)"
arch=('any')
# url="https://github.com/jdleicher/MassHash"
url="http://jdleicher.github.io/MassHash"
license=('GPL3')
source=("https://github.com/jdleicher/MassHash/archive/$pkgver.tar.gz"
        "masshash-launcher.desktop")
md5sums=('c1dcf72a7316b230c495d2c70b8a4860'
         '5dd1c93f1e636c24fe1d9d42eeaf0568')

package_masshash() {
	depends=('python')

	cd "$srcdir/MassHash-$pkgver"
	install -m755 -d "$pkgdir/usr/bin"
	install -m755 -d "$pkgdir/usr/share/doc/mashhash"
	install -m755 python3/masshash "$pkgdir/usr/bin"
	install -m644 README.md "$pkgdir/usr/share/doc/mashhash/"
	install -m644 AUTHORS "$pkgdir/usr/share/doc/mashhash/"
}

package_masshash-launcher() {
	depends=('masshash' 'python-gobject' 'gtk3' 'hicolor-icon-theme')
	install=masshash-launcher.install

	cd "$srcdir/MassHash-$pkgver"
	install -m755 -d "$pkgdir/usr/bin"
	install -m755 -d "$pkgdir/usr/share/applications"
	install -m755 -d "$pkgdir/usr/share/masshash-launcher"
	install -m755 -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -m755 python3/masshash-launcher "$pkgdir/usr/bin/"
	install -m644 data/masshash-launcher.glade "$pkgdir/usr/share/masshash-launcher/"
	install -m644 data/masshash-launcher.svg "$pkgdir/usr/share/masshash-launcher/"
	install -m644 data/masshash-launcher.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -m644 "$srcdir/masshash-launcher.desktop" "$pkgdir/usr/share/applications/"
}
