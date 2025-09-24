pkgver=3.6.17
pkgrel=296
sha256sums=("31dc3d4c1d8bb0aa71b8fb23e841e14e1f79c4b10befc7cb9dc20554fed87f65"
            "b5c9aadd1b2172158f0b0ff07fdaf84721c002bb5cd1394c9f9fe4557533964d"
            "65370e5aa8edb5cb8a3c66b385a782370cc5d5c578f7e4073f66e17fbc98ff5d")
_pkgname=hmcl-dev
pkgname=hmcl-dev-bin
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular"
url="https://github.com/huanghongxun/HMCL"
license=("GPL3")
arch=('any')
depends=('java-runtime')
source=("http://mirrors.cloud.tencent.com/nexus/repository/maven-public/org/glavo/hmcl/hmcl-dev/$pkgver.$pkgrel/hmcl-dev-$pkgver.$pkgrel.jar"
        "start.sh"
        "hmcl-dev.desktop")
noextract=("hmcl-dev-$pkgver.$pkgrel.jar"
        "start.sh"
        "hmcl-dev.desktop")

package(){
    des="$pkgdir/opt/hmcl-dev"
    jn="hmcl-dev-$pkgver.$pkgrel.jar"

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