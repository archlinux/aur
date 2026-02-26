pkgname=sddm-slice-qt6-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple dark SDDM theme with many customization options. Upstream updated to work with QT6."
arch=('any')
url="https://github.com/gchamon/sddm-slice"
license=('CCPL:cc-by-sa')
depends=('sddm' 'qt5-graphicaleffects')
makedepends=('git')
provides=("sddm-slice")
conflicts=("sddm-slice")
_theme_name='slice'
_repo_name='sddm-slice'
source=("git+https://github.com/gchamon/${_repo_name}.git#branch=master")
md5sums=('SKIP')

pkgver() {
    echo "$(git -C "${srcdir}/${_repo_name}" rev-list --count HEAD).0.0"
}

package() {
    install -d "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}"
    cp -r "${srcdir}/${_repo_name}"/* "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}"/
    find "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}" -type d -exec chmod 555 {} \;
    find "${pkgdir}"/usr/share/sddm/themes/"${_theme_name}" -type f -exec chmod 444 {} \;
}
