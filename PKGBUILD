# Maintainer: cyberxndr <cyberxndr@gmail.com>

pkgname=mytetra
pkgver=1.42.2
pkgrel=3
pkgdesc="Personal manager for data memorization and structuring notes"
arch=('x86_64')
url="https://github.com/xintrea/mytetra_dev"
license=('GPL3')
source=("http://webhamster.ru/db/data/articles/105/mytetra_1_42_2_lin_64.tar.gz")
md5sums=('54e36bac3f2d06d2d1bf6fd77501bb63')

prepare(){
        cd mytetra_1_42_2_lin_64

        echo '#!/bin/sh' > mytetra.run
        echo 'PROGDIR="/opt/mytetra"' >> mytetra.run
        echo 'LD_LIBRARY_PATH=$PROGDIR/lib:${LD_LIBRARY_PATH}' >> mytetra.run
        echo 'export LD_LIBRARY_PATH' >> mytetra.run
        echo '$PROGDIR/mytetra' >> mytetra.run 
}

package(){
        cd mytetra_1_42_2_lin_64

        mkdir -p "${pkgdir}/opt/mytetra"
        cp * "${pkgdir}/opt/mytetra/" -r

        mkdir -p "${pkgdir}/usr/bin/"
        ln -s /opt/mytetra/mytetra.run "${pkgdir}/usr/bin/mytetra" 
}
