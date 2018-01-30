#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Maintainer: Dawid Wrobel <cromo@klej.net>
#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
#Maintainer: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.2.9
pkgrel=1
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-pycurl')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz")
md5sums=('136bd26bdf301e169d873d4d0e5a226c')
package() {
    mkdir -p ${pkgdir}/opt/wfuzz
    mkdir -p ${pkgdir}/usr/bin
    cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/wfuzz/
    echo -e "#!/bin/bash\n\ncd /opt/wfuzz\n/opt/wfuzz/wfuzz \$@" > ${pkgdir}/usr/bin/wfuzz
    sed -i '0,/RE/s/python/python2/' ${pkgdir}/opt/wfuzz/wfuzz
    chmod a+x ${pkgdir}/usr/bin/wfuzz
}
