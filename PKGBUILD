# Maintainer: Wesofer Raymond <wesetoferraymond@gmail.com>
# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=logseq-desktop
pkgver=0.0.17
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop")
conflicts=("logseq-desktop-git" "logseq-desktop")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${pkgname}.desktop")
md5sums=('7710e7010b458ada3cdb7f6cdd37dffc'
         '7f1ac5c621059b3959a318882acf990e')

package() {
    cd "$srcdir/Logseq-linux-x64"
    #desktop file
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/logseq.desktop
    install -Dm644 "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/Logseq-linux-x64/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/Logseq ${pkgdir}/usr/bin/logseq
}
