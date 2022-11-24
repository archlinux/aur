# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
_basename='sway-screenshot'
pkgname="$_basename-git"
pkgver=1.0.0.r0.53a3e60
pkgrel=1
pkgdesc="A utility to easily take screenshots in swaywm using your mouse"
arch=('any')
url="https://github.com/Gustash/sway-screenshot"
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify' 'imagemagick')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://github.com/Gustash/sway-screenshot.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"

    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/$_basename"
    mkdir -p "$pkgdir/usr/bin"

    cp sway-screenshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
