# Submitter: Lucjan SQ5FGB <lucck at boff dot pl>
# Maintainer: Alexander Fasching OE5TKM <fasching.a91@gmail.com>

pkgname=vna_j
_realname=vnaJ
pkgver=3.2.9
pkgrel=1
pkgdesc="GUI for various vector network analyzers"
arch=('any')
license=('custom')
url="http://vnaj.dl2sba.com/"
depends=('java-environment>=10' 'hicolor-icon-theme' 'bash')
optdepends=('xdg-utils: desktop & menu shortcut support')
makedepends=('imagemagick')
install=vna_j.install
source=(http://download.dl2sba.com/vnaj/$pkgver/${_realname}.${pkgver}.jar
        vnaJ.sh vnaJ.desktop http://download.dl2sba.com/vnaj/$pkgver/logo.ico)
md5sums=('049726c16493a59b83c50b06837a2665'
         '305963e8e79cbab0741a535207020e2c'
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
