# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=debtap-mod
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/debtap-mod"
pkgdesc="Convert and install .deb packages"
source=("git+https://github.com/biglinux/debtap-mod.git")
md5sums=(SKIP)
depends=('yad' 'namcap' 'pamac-gtk' 'kate' 'zenity' 'fakeroot')

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


