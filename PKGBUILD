# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# This package can no longer build from source with cuda >= 6.5. Nvidia has
# dropped support for compute_10 which is needed for cryptohaze

pkgname=cryptohazemultiforcer
pkgver=1.31
pkgrel=1
pkgdesc="High performance multihash brute forcer with CUDA support"
url="http://www.cryptohaze.com/multiforcer.php"
license=(custom)
arch=(i686 x86_64)
depends=(nvidia)
source_x86_64=(http://downloads.sourceforge.net/project/cryptohaze/Cryptohaze-Linux_x64_${pkgver/./_}.tar.bz2
               cryptohazemultiforcer)
sha512sums_x86_64=('d374516793ed513e20684f0ebbbd544c3ef895bc1b556316ae4892a7f219fddb9195cf29e91014f2ef00405077527e5a7cf3fefcd49906252e2471d2b8fc6e28'
                   'e05c8318b6e178d6b3300a233f713d0acf0d7c64505aeaeed5f9713f1e02ed069b27fbb688a96132ecc7f5f599a5c867c2da45f3aa612ab9876075c83d0335b5')

package() {
    cd "${srcdir}/Cryptohaze-Linux"
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    cp -av ./. "${pkgdir}/opt/${pkgname}/"
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/"
}
