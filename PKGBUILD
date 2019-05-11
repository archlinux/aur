# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=gnome-pass-search-provider-git
_pkgname=gnome-pass-search-provider
pkgver=r9.bed2f59
pkgrel=1
pkgdesc="Gnome Shell search provider for the pass (passwordstore.org) password manager that sends passwords to clipboard (with facultative GPaste integration)"
arch=('any')
url="https://github.com/jle64/gnome-pass-search-provider"
license=('GPL')
depends=('python-gobject' 'python-dbus' 'pass' 'python-fuzzywuzzy')
optdepends=('gpaste')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('gnome-pass-search-provider::git://github.com/jle64/gnome-pass-search-provider.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$_pkgname"
	DATADIR="$pkgdir/usr/share" \
	LIBDIR="$pkgdir/usr/lib" \
	LIBEXECDIR="$pkgdir/usr/lib" \
	SYSCONFDIR="$PREFIX/etc" \
	./install.sh 
}

