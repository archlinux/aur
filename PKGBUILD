# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=biglinux-noise-reduction-pipewire
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/biglinux-noise-reduction-pipewire"
pkgdesc="Interface to enable or disable microphone noise reduction, using https://github.com/werman/noise-suppression-for-voice"
depends=('bigbashview' 'noise-suppression-for-voice>=0.91.3-1' 'pipewire')
source=("git+https://github.com/biglinux/biglinux-noise-reduction-pipewire.git")
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

