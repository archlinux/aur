# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Ivan Petruk <localizator@ukr.net>

_pkgname=gnome-shell-theme-super-flat-remix
pkgname="${_pkgname}-git"
pkgver=r5.3c67ade
pkgrel=1
pkgdesc="Super Flat remix GNOME theme is a pretty simple shell theme, derived from Paper theme. (Git version)"
arch=('any')
url="https://github.com/daniruiz/Super-Flat-Remix-GNOME-theme/"
groups=('gnome-shell-extensions')
license=('CCPL:cc-by-nc-sa-3.0')
depends=('gnome-shell')
source=("${_pkgname}::git+https://github.com/daniruiz/Super-Flat-Remix-GNOME-theme.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}/"
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -a "Super Flat Remix GNOME theme" "${pkgdir}/usr/share/themes/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
