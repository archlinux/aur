# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Ivan Petruk <localizator@ukr.net>
# Comaintainer:  daniruiz <daniruizdealegria@gmail.com>

_pkgname=gnome-shell-theme-super-flat-remix
pkgname="${_pkgname}-git"
pkgver=r58.4540417
pkgrel=1
pkgdesc="Flat Remix GNOME theme is a pretty simple shell theme inspired on material design (git version)"
arch=('any')
url="https://github.com/daniruiz/Flat-Remix-GNOME-theme/"
groups=('gnome-shell-extensions')
license=('CC-BY-SA-4.0')
depends=('gnome-shell')
source=("${_pkgname}::git+https://github.com/daniruiz/Flat-Remix-GNOME-theme.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}/"
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -a "Flat Remix" "${pkgdir}/usr/share/themes/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
