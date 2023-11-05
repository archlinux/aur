# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='oxygen-cursors'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Beautiful Cursors themes'
arch=('any')
url='https://github.com/wo2ni/Oxygen-Cursors'
license=('GPL3')
depends=('libx11' 'libxcursor' 'libpng')
optdepends=(        
    'lxappearance'
    'gnome-tweaks'
)
source=("https://github.com/wo2ni/Oxygen-Cursors/releases/download/v${pkgver}/${pkgname}.tar.bz2"
)

sha256sums=('b87ee63366bfe45e462d0e090971d2977a7bf4e0ed3ffeba3c8fbeb910fb9c81')

package() {
    msg 'This free Beautiful cursors themes'
    for i in "${pkgname}"/*
    do
        page=$(echo ${i}|cut -d '/' -f '2')
        install -dm755 "${i}" "${pkgdir}"/usr/share/icons/"${page}"/cursors

        install -Dm644 "${srcdir}/${i}"/*theme "${pkgdir}"/usr/share/icons/"${page}"
        install -Dm644 "${srcdir}/${i}"/cursors/* "${pkgdir}"/usr/share/icons/"${page}"/cursors
    done
}
