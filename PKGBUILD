pkgname=berusky-dos
pkgver=v0.1.0
pkgrel=1
pkgdesc="Berušky (DOS verze)"
arch=(any)
url=https://www.anakreon.cz/Berusky.html
license=(GPL2)
depends=(dosbox)
install=$pkgname.install
source=(
    https://www.anakreon.cz/download/{berusky,urovne}.zip
    urovne.bat
    berusky-{dos,edit}{,42}.png
    berusky-{dos,urovne}.desktop)
md5sums=(
    279e2837172a38b61fd88da4795c56d7
    da887f103f5a527cece2ed535a3d5959
    221cbc448bd6c8f0869b3048d31608d9
    dd11ef3387724f075607871102505be4
    1406b05ecd46bf4128aeb43134191c78
    6ca81b8440d69089ea2b6ebd773c6e75
    baab9a0144847dee9e08d20d1ca0263c
    00fb3d23e038e6edf24f5e2e6dcfa709
    9df885fc6e5b0a6c0f2af9bf396732e9)
package(){
    install -dm757 $pkgdir/usr/share/$pkgname
    cp -r DOC MOD SMP BERUSKY.{CFG,DAT,EXE} CWSDPMI.EXE FILE_ID.DIZ SETUP.EXE urovne.bat $pkgdir/usr/share/$pkgname
    install *.LV3 read_me.txt -Dt $pkgdir/usr/share/$pkgname/urovne
    install berusky-{dos,edit}.png -Dt $pkgdir/usr/share/icons/hicolor/22x22/apps
    install -D {berusky-dos42,$pkgdir/usr/share/icons/hicolor/48x48/apps/berusky-dos}.png   # berusky.png koliduje s "berusky"
    install -D {berusky-edit42,$pkgdir/usr/share/icons/hicolor/48x48/apps/berusky-edit}.png
    install berusky-{dos,urovne}.desktop -Dt $pkgdir/usr/share/applications
}
