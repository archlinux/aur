_pkgname=hmcl-dev
pkgname=hmcl-dev-bin
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular"
pkgver=3.6.11
pkgrel=266
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
sha256sums=("38ccab521a8393d489b4cf62c74910494ce41ce4360f4d771e71a2cdb1aa87bd"
            "b5c9aadd1b2172158f0b0ff07fdaf84721c002bb5cd1394c9f9fe4557533964d"
            "65370e5aa8edb5cb8a3c66b385a782370cc5d5c578f7e4073f66e17fbc98ff5d")

package(){
    des="$pkgdir/opt/hmcl-dev"
    jn="hmcl-dev-$pkgver.$pkgrel.jar"

    install -d $des -m 777
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/icons/hicolor/150x150/apps
    install -m 755 start.sh $des/
    install -m 644 $jn $des/hmcl.jar
    install -m 644 hmcl-dev.desktop $pkgdir/usr/share/applications/
    jar xvf $jn LICENSE.txt
    install -m 644 LICENSE.txt $des/
    jar xvf $jn assets/img/craft_table.png
    install -m 644 assets/img/craft_table.png $pkgdir/usr/share/icons/hicolor/150x150/apps/hmcl.png
}
