# Maintainer: workonfire <kolucki62@gmail.com>

pkgname=gnome-dark-apps-git
pkgver=r4.7d002aa
pkgrel=1
pkgdesc="Per application dark theme on demand."
arch=('any')
url="https://github.com/workonfire/gnome-dark-apps"
license=('GPL')
depends=('xdotool')
conflicts=('gnome-dark-apps')
provides=('gnome-dark-apps')
source=("${pkgname}"::git+https://github.com/workonfire/gnome-dark-apps.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "${srcdir}"/"${pkgname}"/theme.sh "${pkgdir}"/usr/bin/dark-theme-toggle
	install -Dm644 "${srcdir}"/"${pkgname}"/app-list "${pkgdir}"/usr/share/gnome-dark-apps/app-list
	install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
