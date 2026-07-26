# Maintainer: Bruno Goncalves <bigbruno@gmail.com>
# shellcheck disable=all

pkgname=rpmtoarch
pkgver=23.10.18
_pkgver=$pkgver-1602
pkgrel=1
arch=('any')
license=('GPL')
depends=('yad' 'namcap' 'pamac' 'zenity' 'fakeroot' 'ruby' 'rpm-tools' 'cpio')
url="https://github.com/biglinux/rpmtoarch"
pkgdesc="Convert and install .rpm packages"
source=("git+https://github.com/biglinux/rpmtoarch.git")
source=("https://github.com/biglinux/rpmtoarch/archive/refs/tags/rpmtoarch-${_pkgver}.tar.gz")
sha256sums=('6e2331ee0793c8d830c7cefbaa1bb2f3b46d993e7cbaac1b63e1c60b61afb5f7')

package() {
# Default Folder
        InternalDir="${srcdir}/${pkgname}-${pkgname}-${_pkgver}/${pkgname}"

    # Copy files
    if [ -d "${InternalDir}/usr" ]; then
        cp -r "${InternalDir}/usr" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/etc" ]; then
        cp -r "${InternalDir}/etc" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/opt" ]; then
        cp -r "${InternalDir}/opt" "${pkgdir}/"
    fi
}

