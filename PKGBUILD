#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=neroaac
pkgver=1.5.4.0
pkgrel=3
pkgdesc='Nero AAC audio codec (dec/enc/tag) all-in-one.'
arch=(x86_64 i686)
url='http://www.nero.com/enu/technologies-aac-codec.html'
license=(custom)
depends_x86_64=(lib32-gcc-libs)
depends_i686=(gcc-libs)
source=('http://ftp6.nero.com/tools/NeroAACCodec-1.5.1.zip')
md5sums=('150ead71fb7838c52a31098c85b91211')
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
