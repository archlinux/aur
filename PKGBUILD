_pkgname=hmcl-dev
pkgname=hmcl-dev-bin
pkgver=3.5.3
pkgrel=228
url="https://github.com/huanghongxun/HMCL"
license=("GPL3")
arch=('any')
depends=('jre19-openjdk')
source=("https://maven.aliyun.com/repository/central/org/glavo/hmcl/hmcl-dev/$pkgver.$pkgrel/hmcl-dev-$pkgver.$pkgrel.jar"
        "start.sh"
        "hmcl-dev.desktop")
noextract=("hmcl-dev-$pkgver.$pkgrel.jar"
        "start.sh"
        "hmcl-dev.desktop")
sha256sums=("d4808b56a309d0857ad90781efe7f23f12847c09ab7906449a454323455fcb38"
            "b5c9aadd1b2172158f0b0ff07fdaf84721c002bb5cd1394c9f9fe4557533964d"
            "41b822c08d4b1ecffa55dcc1defc455c82e6a6bdc86c802460e794fcc42e76e3")

package(){
    des="$pkgdir/opt/hmcl-dev"
    jn="hmcl-dev-$pkgver.$pkgrel.jar"

    install -d $des -m 777
    mkdir -p $pkgdir/usr/share/applications
    install -m 755 start.sh $des/
    install -m 644 $jn $des/hmcl.jar
    install -m 644 hmcl-dev.desktop $pkgdir/usr/share/applications/
    jar xvf $jn LICENSE.txt
    install -m 644 LICENSE.txt $des/
    jar xvf $jn assets/img/craft_table.png
    install -m 644 assets/img/craft_table.png $des/icon.png
}
