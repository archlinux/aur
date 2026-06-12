# Maintainer: toazd <wmcdannell@gmail.com>
pkgname=selah-bin
_pkgname=selah
pkgver=0.7.6
pkgrel=1
pkgdesc="A cross-platform Bible study app using Flutter and the 1769 King James Version"
arch=('x86_64')
url="https://github.com/toazd/selah"
license=('unlicense')
depends=('gtk3' 'glib2' 'gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/toazd/selah/releases/download/v0.7.6-build.103/selah-0.7.6-1-x86_64.pkg.tar.zst")
sha256sums=('020bbf70258515f03c485d0f494f8a8e903a3220243c85bc809f0c2b15b82c64')

package() {
    # Extract package hierarchy directly to destination root
    if [ -d "${srcdir}/usr" ]; then
        cp -r "${srcdir}/usr" "${pkgdir}/"
    fi

    if [ -d "${srcdir}/opt" ]; then
        cp -r "${srcdir}/opt" "${pkgdir}/"
    fi
}
