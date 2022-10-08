# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=rpmtoarch
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/rpmtoarch"
pkgdesc="Convert and install .rpm packages"
source=("git+https://github.com/biglinux/rpmtoarch.git")
depends=('yad' 'namcap' 'pamac-gtk' 'kate' 'zenity' 'fakeroot' 'ruby' 'rpm-tools' 'cpio')
md5sums=(SKIP)

package() {
    # Verify default folder
    if [ -d "${srcdir}/${pkgname}/${pkgname}" ]; then
        InternalDir="${srcdir}/${pkgname}/${pkgname}"
    else
        InternalDir="${srcdir}/${pkgname}"
    fi


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
