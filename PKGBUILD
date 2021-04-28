# Submitter: Lucjan SQ5FGB <lucck at boff dot pl>
# Maintainer: Alexander Fasching OE5TKM <fasching.a91@gmail.com>

pkgname=vna_j
_realname=vnaJ
pkgver=3.4.7
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
sha256sums=('4326882f69b68b6159a00b2ee2969efd968b3bd800a140efa1135fdbd22fa98b'
            'cf188ba0153e9227a8db441c03f8566dee523c65e42097ea1f7d8041f1b68e43'
            'a1a4b6cc03a832d0d0d564a8e4ce07c58532ff5e7d9a1bdeaf7e5acbfb8907a6'
            'e4868277a6f4f1da10cfeaba58086d6f76b79a057be4ba7a72aab9d9f686f7fb')

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
