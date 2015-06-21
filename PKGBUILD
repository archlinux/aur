#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Maintainer: Dawid Wrobel <cromo@klej.net>
#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
#Maintainer: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.1beta
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
source=("https://github.com/xmendez/wfuzz/releases/download/v2.1-beta/${pkgname}-2.1.beta.tar.gz")
md5sums=('8aa60e900483553223fd989922c05b91')
package() {
	mkdir -p ${pkgdir}/opt/wfuzz
    mkdir -p ${pkgdir}/usr/bin
	cp -r ${srcdir}/wfuzz-2.1-beta/* ${pkgdir}/opt/wfuzz/
	echo -e "#!/bin/bash\n\ncd /opt/wfuzz\npython2.7 /opt/wfuzz/wfuzz.py \$@" > ${pkgdir}/usr/bin/wfuzz
    sed -i '0,/RE/s/python/python2/' ${pkgdir}/opt/wfuzz/wfuzz.py
	chmod a+x ${pkgdir}/usr/bin/wfuzz
}
