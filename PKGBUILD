# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=bigcontrolcenter
pkgver=$(date +%Y_%m_%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/bigcontrolcenter"
pkgdesc="Complete control center to use in BigLinux with KDE"
depends=('bigbashview' 'kdialog' 'print-manager' 'gnome-alsamixer' 'inxi' 'biglinux-driver-manager' 'geticons')
source=("git+https://github.com/biglinux/bigcontrolcenter.git")
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

