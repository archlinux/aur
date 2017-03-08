# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_pkgname=papirus-libreoffice-theme-git
pkgname=papirus-libreoffice-fresh-rpm-theme-git
pkgver=20170228
pkgrel=1
pkgdesc="Papirus theme for LibreOffice-Fresh RPM (git version)"
url="https://github.com/PapirusDevelopmentTeam/${_pkgname%-git}"
arch=('any')
license=('GPL')
depends=('libreoffice-fresh-rpm')
makedepends=('git')
conflicts=('papirus-libreoffice-theme' 'libreoffice-papirus-theme' 'libreoffice-papirus-theme-git')
options=('!strip')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd ${_pkgname}
  mkdir -p ${pkgdir}/opt/libreoffice5.3/share/config
  cp --no-preserve=mode,ownership -r \
    images_papirus.zip \
    images_papirus_dark.zip  \
    images_epapirus.zip \
    ${pkgdir}/opt/libreoffice5.2/share/config
}
