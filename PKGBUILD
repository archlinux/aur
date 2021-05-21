# Maintainer: Wesofer Raymond <wesetoferraymond@gmail.com>
# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=logseq-desktop-canary
pkgver=0.0.4
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("logseq-desktop-canary")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${pkgname}.desktop")
sha256sums=('6cefae30c5e923c51a8257892a2d60a13bfd1b414f4febc1a68df50ceb9b7a16'
            '9ff8105001989b76a96165b75bf60dd089e9138dcc607d22a10c918efee4f664')

package() {
    # desktop file
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/logseq-canary.desktop
    # icons
    install -Dm644 "$srcdir/Logseq Canary-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/pixmaps/logseq-canary.png"
    install -d ${pkgdir}/opt/${pkgname}
    cp -r $srcdir/"Logseq Canary-linux-x64"/* ${pkgdir}/opt/${pkgname}/
    install -d ${pkgdir}/usr/bin
    ln -s "/opt/${pkgname}/Logseq Canary" ${pkgdir}/usr/bin/logseq-canary
}
