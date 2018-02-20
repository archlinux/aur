# Maintainer: Karol Babioch <karol@babioch.de

pkgname=openexif
pkgver=2.1.4
pkgrel=1
pkgdesc="An object-oriented interface to Exif files"
arch=('x86_64')
url="https://openexif.sourceforge.net"
license=('BSD')
_srcname="${pkgname}-${pkgver//./_}-src"
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${_srcname}.zip")
sha256sums=('236a26abaa732d25fa7533f3bdf065588f49ac47db3ed6b08d7be001401e47f0')

build() {
    cd "${srcdir}/${_srcname}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${_srcname}"
    make DESTDIR="${pkgdir}" install
    install -Dm0644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

