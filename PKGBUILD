# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
_basename='hyprshot'
pkgname="$_basename-git"
pkgver=1.2.3.r0.0c60c49
pkgrel=1
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
url="https://github.com/Gustash/Hyprshot"
license=('GPL')
depends=('bash' 'jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://github.com/Gustash/Hyprshot.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"

    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/$_basename"
    mkdir -p "$pkgdir/usr/bin"

    cp hyprshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
