# Maintainer: mibbio <contact at mibbiodev dot de>

_name='Ciliora-Tertia'
pkgname=cinnamon-theme-${_name,,}-git
pkgver=r133.97b0e77
pkgrel=3
pkgdesc="${_name} theme for Cinnamon"
arch=('any')
url="https://github.com/zagortenay333/${_name,,}-cinnamon"
license=('GPL')
depends=('cinnamon>=3.0.0' 'cinnamon<3.1.0')
replaces=("cinnamon-theme-${_name,,}")
conflicts=("cinnamon-theme-${_name,,}")
source=("git+https://github.com/zagortenay333/${_name,,}-cinnamon")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name,,}-cinnamon"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_name,,}-cinnamon"
    find ${_name} -type f -not -name *~ -not -name *.sh -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
