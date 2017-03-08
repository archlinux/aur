# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

pkgname=papirus-libreoffice-theme-git
pkgver=20170228
pkgrel=1
pkgdesc="Papirus theme for LibreOffice (git version)"
url="https://github.com/PapirusDevelopmentTeam/${pkgname%-git}"
arch=('any')
license=('GPL')
depends=('libreoffice')
makedepends=('git')
conflicts=('papirus-libreoffice-theme' 'libreoffice-papirus-theme' 'libreoffice-papirus-theme-git')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    #cd ${pkgname}
    #mkdir -p ${pkgdir}/usr/lib/libreoffice/share/config
    #cp --no-preserve=mode,ownership -r \
    #    images_papirus.zip \
    #    images_papirus_dark.zip  \
    #    images_epapirus.zip \
    #    ${pkgdir}/usr/lib/libreoffice/share/config
    cd "${srcdir}/${pkgname}"
    make PREFIX="/usr/lib" DESTDIR="${pkgdir}" install
}
