# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=orbada
pkgver=1.2.5.395
pkgrel=1
pkgdesc="Database SQL, query tool, using JDBC for Oracle, SQLite, Firebird, etc"
arch=('i686' 'x86_64')
url="http://orbada.sourceforge.net/"
license=('GPL3')
depends=('java-runtime>=1.7')
source=("http://sourceforge.net/projects/${pkgname}/files/Orbada/${pkgver}/${pkgname}.zip" 
        'orbada.sh' 'orbada.desktop')
sha1sums=('eca6e56dd4a2f75232f3b4130e5b34189e623823'
          '17e928950be91a09765a7e3ec0cb42d3bdf91222'
          'a0058b5ab2aa050958341a062c1db6085fd4d34a')

package()
{
    # Install files to /opt
    mkdir ${pkgdir}/opt
    mv ${srcdir}/${pkgname} ${pkgdir}/opt

    # Remove unecessary Windows files
    rm ${pkgdir}/opt/${pkgname}/${pkgname}{.bat,.vbs}

    # Install binaries
    chmod +x ${pkgdir}/opt/${pkgname}/${pkgname}.sh 
    install -m 755 -D $srcdir/orbada.sh $pkgdir/usr/bin/orbada

    # Install menu item
    install -m 644 -D ${srcdir}/orbada.desktop ${pkgdir}/usr/share/applications/orbada.desktop
}
