# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: crshd <crshd@mail.com>

pkgname=nafe
pkgver=0.1
pkgrel=1
pkgdesc="Toolset to translate PSF format consolefonts into text files and text files into PSF files."
url="https://nafe.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPL2')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('06d6a9b63f4acff046695c676633895e9d0ae95444de9273b126eace6677102b')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p -- "${pkgdir}/usr/bin"
    cp -- txt2psf psf2txt "${pkgdir}/usr/bin"
}

