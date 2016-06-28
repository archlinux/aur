# Use http://www.rot13.com/ to decipher address.
# Maintainer: Daniele Bartolini <qonegbyvav.nn [4G] tznvy [Q0G] pbz>

pkgname=pepper
pkgver=0.0.23
pkgrel=2
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://github.com/taylor001/crown"
license=('MIT' 'GPL')
depends=('glib2>=2.40'
         'gtk3>=3.14'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/taylor001/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "pepper.sh"
        "pepper.desktop"
        )
md5sums=('c55d4235bb481f6bb7301b3bc151972c'
         '8fca300dce4e3858e34e7a2d550a3728'
         '7424db2a97c159d516cfa813be148966')

package() {
    mkdir $pkgdir/opt
    mkdir $pkgdir/opt/pepper
    cp -r $pkgname $pkgdir/opt/
    install -D -m755 pepper.sh "${pkgdir}/usr/bin/pepper"
    install -D -m644 pepper.desktop "${pkgdir}/usr/share/applications/pepper.desktop"
    install -D -m644 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m644 $pkgname/tools/ui/icons/pepper-16x16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/pepper.png"
    install -D -m644 $pkgname/tools/ui/icons/pepper-24x24.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/pepper.png"
    install -D -m644 $pkgname/tools/ui/icons/pepper-32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pepper.png"
    install -D -m644 $pkgname/tools/ui/icons/pepper-64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/pepper.png"
    install -D -m644 $pkgname/tools/ui/icons/pepper-128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pepper.png"
    install -D -m644 $pkgname/tools/ui/icons/pepper-256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pepper.png"
    install -D -m644 $pkgname/tools/ui/icons/pepper.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pepper.svg"
}
