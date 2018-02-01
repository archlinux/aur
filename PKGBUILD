# Maintainer: Paul Sajna <sajattack@gmail.com>
pkgname=spredit
pkgver=1.0
pkgrel=1
pkgdesc="SPRedit - a C64 hires/overlay sprite editor. This is a crossplatform tool to create Commodore 64 hires or overlayed sprites, and convert between various formats like native C64 'prg' or 'bmp' from/to this program's own 'ols' format."
arch=('i686' 'x86_64')
url="http://csdb.dk/release/?id=93234"
depends=('allegro4')
source=("http://csdb.dk/getinternalfile.php/93647/SPRedit-for-linux.zip")
sha512sums=("3f628c6eeddbaa1742a2a597a93d191de4db4f0f4c170dc703eb64c2e31c7769ee542e8275420b03d191e946545ccd5fdefc6fc298dffffe593062f2f8f6a71b")

build() {
      cd "${srcdir}/SPRedit-for-linux/source"
      make
}

package() {
    chown 777 "${srcdir}/SPRedit-for-linux/source/SPRedit"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/icons"
    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/SPRedit-for-linux/source/SPRedit" "${pkgdir}/usr/bin/"
    cp "${srcdir}/SPRedit-for-linux/source/SPRedit.png" "${pkgdir}/usr/share/icons/"
    cp "${srcdir}/SPRedit-for-linux/source/SPRedit.desktop" "${pkgdir}/usr/share/applications/"
     
}
