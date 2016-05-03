# Maintainer: zekeer <isoniasid@gmail.com>

_pkgname=papirus-icons-git
pkgbase=papirus-icons-git
pkgname=papirus-icons-git
pkgver=r4.affc0a1
_git=affc0a16669a453d760ea14a27f3bed655ce5a08
_repo=papirus-icons
pkgrel=1
pkgdesc="Papirus Icons for LXQT,Xfce, Mate, Cinnamon, Gnome (git version)"
arch=('any')
url="https://github.com/manjarqo/${_repo}"
license=('CCPL:by-sa')
options=()
makedepends=('git'  'xdg-utils')
depends=('gtk-update-icon-cache')
conflicts=('papirus')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_papirus-icons-git() {
    pkgdesc="Papirus Icons for LXQT,Xfce, Mate, Cinnamon, Gnome (git version)"
    options=('!strip')
    makedepends=('git' 'xdg-utils')
    depends=('gtk-update-icon-cache')
    optdepends=()
    conflicts=('papirus-gtk-icon-theme' 'papirus-gtk-icon-theme-git' 'papirus-icon-theme-gtk')
    install -dm755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_pkgname}/Papirus* ${pkgdir}/usr/share/icons/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}