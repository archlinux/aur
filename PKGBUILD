# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-imagetools
pkgver=8
pkgrel=1
pkgdesc='KDE service menus for image file processing'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-imagetools'
license=('GPL')
depends=('dolphin' 'kdialog' 'libnotify' 'imagemagick' 'perl-image-exiftool' 'pngquant' 'jpegoptim' 'oxipng')
optdepends=('libjxl')
conflicts=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")
replaces=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('86ef0385e8fb1b5eaccbe0be3dd327bdf518fac293b3383b20405aca2d653c7a')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
}
