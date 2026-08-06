pkgver=3.17.0.352
sha256sums=("f05957e622e6782f730b85408b83ddcf93096669abeaa4e25be9eba0941883b4"
            "1d49bb780e3ff4eb1e156465798e7ddc8c6cccd747b683f77ba8c1c4fbb8febb"
            "f5ca7e97dde27aa77a09b46dd191edace0c928e521b6342081b127c564f978ce")
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
