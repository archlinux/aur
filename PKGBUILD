# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=gnome-pass-search-provider-git
_pkgname=gnome-pass-search-provider
pkgver=a6f2fa3add3c36003513032c7c9267fae5b4ed94
pkgrel=1
pkgdesc="Gnome Search provider for pass (zx2c4/passwordstore.org), gopass and compatibles and rbw (Bitwarden/Vaultwarden) that sends passwords to clipboard (or GPaste)"
arch=('any')
url="https://github.com/jle64/gnome-pass-search-provider"
license=('GPL')
depends=('python-gobject' 'python-dbus' 'python-fuzzywuzzy')
optdepends=('gpaste' 'pass' 'rbw' 'gopass')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('gnome-pass-search-provider::git+https://github.com/jle64/gnome-pass-search-provider.git')
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

