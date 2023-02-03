# Maintainer: Abderrahman-byte <el.abderrahman00@gmail.com>
# Contributor: Abderrahman-byte <el.abderrahman00@gmail.com>

pkgname=piranha-servlet
pkgver=23.1.0
pkgrel=1
pkgdesc="Piranha is a cloud native extensible runtime, which delivers various integration libraries facilitating running applications in a non application server centric way."
arch=("any")
url="https://github.com/piranhacloud/piranha"
depends=("jre-openjdk")
provides=("piranha-servlet")


package() {
    mkdir -p $pkgdir/usr/share/piranha-cloud/
    mkdir -p $pkgdir/usr/bin/

    cd $pkgdir/usr/share/piranha-cloud/

    curl -OL "https://repo1.maven.org/maven2/cloud/piranha/dist/piranha-dist-servlet/$pkgver/piranha-dist-servlet-$pkgver.jar"

    ln -s ./piranha-dist-servlet-$pkgver.jar $pkgdir/usr/share/piranha-cloud/piranha-dist-servlet.jar 
    install $startdir/$pkgname $pkgdir/usr/bin/$pkgname
}
