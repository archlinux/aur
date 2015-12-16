# Maintainer: Arvedui <arvedui@posteo.de>

pkgname=dreamfall-chapters-hib
pkgver=4.0.4
pkgrel=1
epoch=1
pkgdesc="Dreamfall Chapters, humble bundle version"
arch=('x86_64')
url="http://redthreadgames.com/"
license=('custom:commercial')
depends=(glu gtk2)
makedepends=(unzip)

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=(hib://Dreamfall_Chapters_Linux4.0.4.tar.gz
        dreamfallchapters.desktop
        dreamfallchapters.png
        dreamfallchapters)
md5sums=(62c3c969178c4839761d1af48846bc82
         1223c964a9d19b4960df9772d5a816e2
         e69bb78abe79f0bd82fa6584428f8be8
         f3d4b06b570eb26be68e84be8ba8d93d)


# compression would take ages
PKGEXT='.pkg.tar'


package() {
    mkdir -p $pkgdir/{opt/dreamfallchapters/,usr/bin/}
    cp -r "$srcdir/Dreamfall Chapters_Data/" $pkgdir/opt/dreamfallchapters/
    cp "$srcdir/Dreamfall Chapters" $pkgdir/opt/dreamfallchapters/
    ln -s "/opt/dreamfallchapters/Dreamfall Chapters" $pkgdir/usr/bin/dreamfallchapters

    install -Dm755 $srcdir/dreamfallchapters $pkgdir/usr/bin/dreamfallchapters
    install -Dm644 dreamfallchapters.desktop $pkgdir/usr/share/applications/dreamfallchapters.desktop
    install -Dm644 "$srcdir/dreamfallchapters.png" $pkgdir/usr/share/pixmaps/dreamfallchapters.png


}
