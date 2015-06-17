# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=orbada
pkgver=1.2.4.369
pkgrel=1
pkgdesc="Database SQL, query tool, using JDBC for Oracle, SQLite, Firebird, etc"
arch=('i686' 'x86_64')
url="http://orbada.sourceforge.net/"
license=('GPL3')
depends=('java-runtime>=1.7')
source=("http://sourceforge.net/projects/${pkgname}/files/Orbada/${pkgver}/${pkgname}.zip" 
        'orbada.sh' 'orbada.desktop')
sha1sums=('d3a3bb97ad2897a9805af3a32ff138e31c816415'
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
