# Contributor: orumin <dev@orum.in>

pkgname=v2c
pkgver=2.11.4
pkgrel=2
pkgdesc="A 2channel and Twitter browser that made from Java+Swing"
arch=('i686' 'x86_64')
url="http://v2c.s50.xrea.com"
license=('custom')
depends=('java-environment')
source=(http://v2c.s50.xrea.com/V2C_${pkgver}.tar.gz
V2C.desktop)
md5sums=('7e8915c4052eae46ffbee572b641deac'
         '148b6340aa6345b42ad0425c2d8fb6b6')

package() {
    mkdir "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"

    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/${pkgname}/v2c" "${pkgdir}/usr/bin"
    cat <<'EOF' > "${pkgdir}/usr/bin/v2c"
#!/bin/sh
cd /opt/v2c/
./v2c $@
EOF

    mkdir -p "${pkgdir}/usr/share/applications"
    cp "${srcdir}/V2C.desktop" "${pkgdir}/usr/share/applications"

    chmod a+x "${pkgdir}/usr/bin/v2c"
    chmod a+x "${pkgdir}/opt/${pkgname}/v2c"
    chmod a+w "${pkgdir}/opt/${pkgname}"
    chmod a+w "${pkgdir}/opt/${pkgname}/launcher"
}
