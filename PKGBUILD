pkgver=3.15.0.346
sha256sums=("1d63b28c1e9fddd586cac9afe5d26e4174bce2a952ef59b4e29b588e28a1dce7"
            "b5c9aadd1b2172158f0b0ff07fdaf84721c002bb5cd1394c9f9fe4557533964d"
            "65370e5aa8edb5cb8a3c66b385a782370cc5d5c578f7e4073f66e17fbc98ff5d")
_pkgname=hmcl-dev
pkgname=hmcl-dev-bin
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular"
url="https://github.com/huanghongxun/HMCL"
license=("GPL3")
arch=('any')
depends=('java-runtime')
source=("https://hmcl.glavo.site/download/HMCL-$pkgver.jar"
        "start.sh"
        "hmcl-dev.desktop")
noextract=("hmcl-dev-$pkgver.jar"
        "start.sh"
        "hmcl-dev.desktop")

package(){
    des="$pkgdir/opt/hmcl-dev"
    jn="HMCL-$pkgver.jar"

    install -d $des -m 777
    install -d $pkgdir/usr/share/applications
    install -d $pkgdir/usr/share/icons/hicolor/150x150/apps
    install -m 755 start.sh $des/
    install -m 644 $jn $des/hmcl.jar
    install -m 644 hmcl-dev.desktop $pkgdir/usr/share/applications/
    jar xvf $jn LICENSE.txt
    install -m 644 LICENSE.txt $des/
    jar xvf $jn assets/img/craft_table.png
    install -m 644 assets/img/craft_table.png $pkgdir/usr/share/icons/hicolor/150x150/apps/hmcl.png
}
