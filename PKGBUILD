# Maintainer: barcia <barcia@opmbx.org>

_gitname=El-General
_pkgname=ElGeneralDark
pkgname=('elgeneral-dark-icon-theme-git')
pkgver=r67.8adb36b
pkgrel=1
pkgdesc="A dark icon theme for Plasma Desktop"
arch=('any')
url="https://github.com/fabianalexisinostroza/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
            cd ${_gitname}
                printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
            install -d ${pkgdir}/usr/share/icons
            cp -r ${srcdir}/${_gitname}/${_pkgname}* ${pkgdir}/usr/share/icons/
            find ${pkgdir}/usr -type f -exec chmod 644 {} \;
            find ${pkgdir}/usr -type d -exec chmod 755 {} \;
            find ${pkgdir}/usr -type f -name '.directory' -delete
}
