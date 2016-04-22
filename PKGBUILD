# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=micropsi2
pkgver=0.8a6
pkgrel=1
pkgdesc="artificial intelligence toolkit implementing concepts from the cognitive architecture MicroPsi"
url="http://www.micropsi.com/"
arch=('any')
license=('unknown')
source=("https://github.com/joschabach/micropsi2/archive/0.8-alpha6.tar.gz")
md5sums=('e2c9a662798de696ee38a995db270d16')
 
package() {
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/micropsi" 
    cp -R "${srcdir}/micropsi2-0.8-alpha6" "${pkgdir}/opt/"
    mv "${pkgdir}/opt/micropsi2-0.8-alpha6" "${pkgdir}/opt/micropsi"
    #ln -s /opt/micropsi/start_micropsi_server.py "${pkgdir}/usr/bin/micropsi-server"
    mkdir -m777 "${pkgdir}/opt/micropsi/resources"

    cat > "${pkgdir}/usr/bin/micropsi-server" << \here
#!/bin/bash
cd /opt/micropsi2
python start_micropsi_server.py
here

    # license
    mv "${pkgdir}/opt/micropsi/license.txt" "${pkgdir}/usr/share/licenses/micropsi/LICENSE"
}
