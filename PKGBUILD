# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=biglinux-grub-restore
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/biglinux-grub-restore"
pkgdesc="Restore your installed system"
depends=('zenity' 'konsole' 'mkinitcpio' 'grub' 'os-prober' 'pamac-cli' 'pacman' 'util-linux' 'manjaro-tools-base')
source=("git+https://github.com/biglinux/biglinux-grub-restore.git")
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


