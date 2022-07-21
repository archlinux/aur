# Maintainer: Curve <curve.platin at gmail.com>
pkgname=nordzy-icon-theme-git
_gitname=Nordzy-icon
pkgver=r86.7e6d2474
pkgrel=1
pkgdesc="Nordzy is a free and open source icon theme for Linux desktops using the Nord color palette from Arctic Ice Studio and based on WhiteSur and Numix Icon Theme."
arch=(any)
url="https://github.com/alvatip/$_gitname"
license=('GPL')
depends=('hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
        cd "$_gitname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

package() {
        cd "${srcdir}/${_gitname}"
        install -dm755 "${pkgdir}/usr/share/icons"
        ./install.sh -d "${pkgdir}/usr/share/icons" --total
}
