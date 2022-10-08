# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=biglinux-driver-manager
pkgver=$(date +%Y_%m_%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/biglinux-driver-manager"
pkgdesc="Complete driver manager and hardware info"
depends=('bigbashview' 'kdialog' 'inxi' 'zenity' 'python-ansi2html')
source=("git+https://github.com/biglinux/biglinux-driver-manager.git")
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
