# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='against'
pkgver='0.2'
pkgrel=1
pkgdesc='A very fast ssh attacking script'
arch=('any')
url='http://nullsecurity.net/tools/cracker.html'
license=('unknown')
depends=('python2' 'python2-paramiko')
source=('https://raw.githubusercontent.com/nullsecuritynet/tools/master/cracker/against/release/against.py')
md5sums=('97dcd3bfb5594579bb7552633ccc6d02')

prepare() {
        cd "${srcdir}"
        sed -i '1c\#!/usr/bin/env python2' "${pkgname}.py"
}
package() {
	cd "${srcdir}"
        install -dm755 "${pkgdir}/usr/bin/"
        chmod +x "${pkgname}.py"
        cp "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
