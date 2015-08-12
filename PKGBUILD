# Maintainer:  anexation
# Contributor: Rob McCathie <rob@manjaro.org>

pkgbase=menda-icon-themes-git
#pkgname=('menda-circle-icon-theme' 'menda-square-icon-theme')
pkgname=('menda-circle-icon-theme-git')
pkgver=r1.a2eb4a0
pkgrel=1
arch=('any')
url="https://github.com/manjaro/menda-icon-themes"
license=('GPL')
depends=('hicolor-icon-theme' 'librsvg')
optdepends=('menda-themes: Recommended themes'
            'menda-themes-dark: Recommended themes')
options=(!emptydirs !strip)
replaces=('menda-icon-themes')
#source=("${pkgbase}-${pkgver}-${pkgrel}.zip::${url}/archive/master.zip")
source=("${pkgbase}::git+https://github.com/manjaro/menda-icon-themes.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package_menda-circle-icon-theme-git() {
  pkgdesc="Menda Circle Icon Theme"
  
  install -dm755 "${pkgdir}/usr/share/icons"
  #install -Dm755 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/${pkgbase}/Menda-Circle" "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}

#package_menda-square-icon-theme() {
#  pkgdesc="Menda Square Icon Theme"
#  
#  install -dm755 "${pkgdir}/usr/share/icons"
#  #install -Dm755 "${srcdir}/${pkgbase}-${_git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#  cp -r "${srcdir}/${pkgbase}-${_git}/Menda-Square" "${pkgdir}/usr/share/icons"
#  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
#  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
#}
