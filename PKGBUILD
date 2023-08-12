# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=rpmtoarch
pkgver=22.11.22
_pkgver=${pkgver}-0012
pkgrel=1
arch=('any')
license=('GPL')
depends=('yad' 'namcap' 'pamac' 'zenity' 'fakeroot' 'ruby' 'rpm-tools' 'cpio')
url="https://github.com/biglinux/rpmtoarch"
pkgdesc="Convert and install .rpm packages"
source=("git+https://github.com/biglinux/rpmtoarch.git")
source=("https://github.com/biglinux/rpmtoarch/archive/refs/tags/rpmtoarch-${_pkgver}.tar.gz")
sha256sums=("91daf1fe3acfbea6bf6e269f8e70e2a131e29988242cad5479fc5c747eb84131")

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

