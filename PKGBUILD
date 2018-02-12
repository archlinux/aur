# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=capsimage4
pkgver=4.2
pkgrel=2
pkgdesc="capsimage library to access IPF and CTR files - maybe needed by some emulators, like hatari/libretro"
arch=('i686' 'x86_64')
url="http://www.softpres.org/"
license=('custom:SPS License')
conflicts=('capsimage')

source_i686=('ipflib42_linux-i686.tar.gz::http://www.softpres.org/_media/files:ipflib42_linux-i686.tar.gz')
source_x86_64=('ipflib42_linux-x86_64.tar.gz::http://www.softpres.org/_media/files:ipflib42_linux-x86_64.tar.gz')

sha256sums_i686=('7445a6807a40c1545b4c6489e76522c2476cee11debb23d1b7e344caa18ba8d9')
sha256sums_x86_64=('ea139673e29a36dc3be7ba916628b5c8a03353bd68be4d346daed803d472ddf3')

package() {
    cd ${srcdir}/${CARCH}-linux-gnu-capsimage
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "libcapsimage.so.4.2" "${pkgdir}/usr/lib/libcapsimage.so.4.2"
    ln -s "libcapsimage.so.4.2" "${pkgdir}/usr/lib/libcapsimage.so"
    install -d ${pkgdir}/usr/include
    cp -r --no-preserve=mode include/* ${pkgdir}/usr/include/
}
