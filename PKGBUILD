# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=ksar_bin
_pkgname=ksar
pkgver=5.2.3
pkgrel=1
pkgdesc="a sar grapher written in java (actively maintained fork)"
arch=('i686' 'x86_64')
url="https://github.com/vlsi/ksar"
license=("BSD")
depends=('java-runtime')
source=("https://github.com/vlsi/ksar/releases/download/v${pkgver}/ksar-${pkgver}-all.jar"
        "ksar.desktop"
	"ksar")
noextract=("ksar-${pkgver}-all.jar")
md5sums=('5e7db5b0da43565666fbfd2161ce2a23'
         '496abd1a51926a52192125ef12b4091b'
         '03ec800bb984188d192bb24bf8e947f8')

package() {
cd $srcdir/
install -Dm644 "ksar-${pkgver}-all.jar" "${pkgdir}/usr/share/java/$_pkgname/$_pkgname.jar"
install -Dm644 ksar.desktop "${pkgdir}/usr/share/applications/kSar.desktop"
install -Dm755 ksar "${pkgdir}/usr/bin/ksar"
}
