# Maintainer: Filip Markovic <f12markovic@gmail.com>
_pkgname="hyprland-screenshot"
pkgname="$_pkgname-git"
pkgver=15.3572e01
pkgrel=1
pkgdesc="Take screenshot easly on Hyprland"
arch=(x86_64 aarch64)
url="https://github.com/vilari-mickopf/$_pkgname"
license=('MIT')
makedepends=('git')
depends=('jq' 'rofi' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
optdepends=('swappy: edit screenshots')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm 755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
