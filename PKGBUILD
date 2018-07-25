#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=neroaac
pkgver=1.5.4.0
pkgrel=4
pkgdesc='Nero AAC audio codec (dec/enc/tag) all-in-one.'
arch=(x86_64)
url='https://wiki.hydrogenaud.io/index.php?title=Nero_AAC'
license=(custom)
depends_x86_64=(lib32-gcc-libs)
depends_i686=(gcc-libs)
source=('https://www.freecodecs.net/fc/fecfb1069e2b67da4fe1e29396e26d27/NeroAACCodec-1.5.1.zip')
sha256sums=('e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b')
conflicts=(neroaacdec neroaacenc neroaactag)
provides=(neroaacdec neroaacenc neroaactag)

package()
{
    cd "$srcdir"
    install -D -m644 NeroAAC_tut.pdf "$pkgdir/usr/share/doc/$pkgname/NeroAAC_tut.pdf"
    install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    cd linux
    install -D -m755 neroAacDec "$pkgdir/usr/bin/neroAacDec"
    install -D -m755 neroAacEnc "$pkgdir/usr/bin/neroAacEnc"
    install -D -m755 neroAacTag "$pkgdir/usr/bin/neroAacTag"
}
