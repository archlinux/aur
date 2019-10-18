# Submitter: Lucjan SQ5FGB <lucck at boff dot pl>
# Maintainer: Alexander Fasching OE5TKM <fasching.a91@gmail.com>

pkgname=vna_j
_realname=vnaJ
pkgver=3.3.3
pkgrel=1
pkgdesc="GUI for various vector network analyzers"
arch=('any')
license=('CCPL:by-nc-nd')
url="http://vnaj.dl2sba.com/"
depends=('java-environment>=10' 'hicolor-icon-theme')
optdepends=('xdg-utils: desktop & menu shortcut support')
makedepends=('imagemagick')
source=(http://download.dl2sba.com/vnaj/$pkgver/${_realname}.${pkgver}.jar
        vnaJ.sh vnaJ.desktop http://download.dl2sba.com/vnaj/$pkgver/logo.ico)
noextract=(${_realname}.${pkgver}.jar)
md5sums=('8bd2e83738a18d8b991b9d1bba8c21b4'
         '4d4958ceef2ddf13c26633e586b15417'
         'e1f40625326a65e5df479f4eae742041'
         '9f3eed2cc9491779155f111d9e3d6bfd')

package() {
    mkdir -p "$pkgdir"{/usr/bin,/usr/share/java/$pkgname}

    # Copying the argo script to /usr/bin
    install -m755 vnaJ.sh "$pkgdir"/usr/bin/vnaJ

    #cd "$srcdir/$pkgname-$pkgver
    # Copying necessary files
    cp ${_realname}.${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/$_realname.jar
    # Install resources
    convert logo.ico logo.png
    install -D -m644 "$srcdir"/logo-0.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/vnaJ.png
    install -D -m644 "$srcdir"/vnaJ.desktop "$pkgdir"/usr/share/applications/vnaJ.desktop
}
