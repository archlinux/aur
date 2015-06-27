# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=starstax
_pkgname=StarStaX
pkgver=0.60 # latest version has not been released for linux yet :(
pkgrel=1
pkgdesc="A fast multi-platform image stacking and blending software, developed primarily for star trail photography."
arch=('i686' 'x86_64')
url="http://www.markus-enzweiler.de/StarStaX/StarStaX.html"
licence='freeware'
depends=('glibc' 'java-runtime' 'freeglut')
optdepends=('libjpeg6-turbo: working with jpg images')

source=('starstax')

source_i686=("${pkgname}-${pkgver}.tgz::https://doc-0c-7o-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/j0ea8dg3fbr06bd9kprl3lpfvqse5b6s/1435384800000/13461038729986161175/*/0B7ixs0uSdAuBRjI4QmNVanRzN1U?e=download")
source_x86_64=("${pkgname}-${pkgver}.tgz::https://doc-08-7o-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/vpof7apbqci1gmp647rsrgp1916mr1fa/1435384800000/13461038729986161175/*/0B7ixs0uSdAuBSHl2RW5UZU9zM2M?e=download")

sha256sums=('07ddaa7839d7af1cfef937f3098b6d5ff00eb1d4d57529bbbfdcb755ad642cda') 
sha256sums_i686=('b75675abd1f85d5ee7ba23c84c725e336abe4292d027b86b771de51fd2affa6b')
sha256sums_x86_64=('511c71ed15d109036dfe1a0447b3f8d0b77bc654690d75f487627bd9490255db')


package() {
    if [ "$CARCH" = "x86_64" ]; then
        _arch="amd64"
    else
        _arch="x86"
    fi
    
    ls
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${_pkgname}-${pkgver}_${_arch}_ubuntu_13.04/" "${pkgdir}/opt/starstax"

    find "${pkgdir}/opt/starstax/" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/starstax/startStarStaXLinux.sh"
    chmod 755 "${pkgdir}/opt/starstax/StarStaX"

    install -d "${pkgdir}/usr/bin"
    cp "${srcdir}/starstax" "${pkgdir}/usr/bin"
    chmod 755 "${pkgdir}/usr/bin/starstax"

}
