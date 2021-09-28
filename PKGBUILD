# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=gnome-pass-search-provider-git
_pkgname=gnome-pass-search-provider
pkgver=r9.bed2f59
pkgrel=4
pkgdesc="Gnome Shell search provider for zx2c4/pass (passwordstore.org) and Bitwarden/Vaultwarden that sends passwords to clipboard (or GPaste)"
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
	./install.sh 
}

