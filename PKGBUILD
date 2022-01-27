# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_pkgname=grub2-theme-breeze
pkgname=grub2-theme-breeze-git
pkgver=5.21.5.r0.gae25316
pkgrel=1
pkgdesc=' A minimalistic GRUB theme inspired by Breeze Resources'
arch=('any')
url='https://github.com/gustawho/grub2-theme-breeze'
license=('CCPL:by-sa')
depends=('grub')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'breeze-grub')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    find breeze -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/grub/themes/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
