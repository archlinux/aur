# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Ivan Petruk <localizator@ukr.net>
pkgname=super-flat-remix-icon-theme
_pkgname=Flat-Remix
pkgver=20161024
pkgrel=1
pkgdesc='a pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr'
arch=('any')
url='http://gnome-look.org/content/show.php/Super+flat+remix+icon+theme?content=169073'
license=('custom:cc-by-nc-sa-3.0')
depends=('xdg-utils')
options=(!strip !emptydirs)
source=("git+https://github.com/daniruiz/Flat-Remix.git")
sha1sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${_pkgname}
	install -dm755 "${pkgdir}/usr/share/icons"
    rm -f "${_pkgname//-/ }"/{CREDITS,LICENSE.txt}
	cp -a "${_pkgname//-/ }" "${pkgdir}/usr/share/icons/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"  
}
