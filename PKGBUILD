# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=roffit
pkgname="$_name-git"
pkgver=r3.7571394
pkgrel=1
pkgdesc="Converts nroff man pages to HTML"
arch=('any')
url="https://daniel.haxx.se/projects/roffit"
license=('custom')
depends=('perl')
provides=("$_name")
conflicts=('roffit')
source=('git+https://github.com/bagder/roffit')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local prefix="$pkgdir/usr"

    local license_prefix="$prefix/share/licenses/$pkgname"
    mkdir -p "$license_prefix"
    cp "$srcdir/$_name/LICENSE" "$license_prefix"

    cd "$srcdir/${_name}"

    local bin_prefix="$prefix/bin"
    mkdir -p "$bin_prefix"
    cp roffit "$bin_prefix"

    local man_prefix="$prefix/share/man/man1"
    mkdir -p "$man_prefix"
    cp roffit.1 "$man_prefix"
}

# vim:et
