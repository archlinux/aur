# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-gtk-theme-git
_pkgname=Sweet
pkgver=r821.d2fd1da
pkgrel=1
pkgdesc="A dark, colorful theme for GTK 3, GTK 4 and GNOME Shell"
arch=('any')
url="https://github.com/Gigas002/$_pkgname-gtk"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
    'python'
)
optdepends=(
    'gnome-shell-extensions: User Themes extension, to use the GNOME Shell theme'
)
conflicts=(
    'plasma5-themes-sweet-full-git'
    'sweet-gtk-theme-dark'
    'sweet-gtk-theme'
    'sweet-theme-git'
)
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    # The stylesheets and images are committed: nothing to build.
    cd "$srcdir/$_pkgname"
    python build.py install "$pkgdir/usr/share/themes"
}
