# Maintainer: David Haller <haller_david@icloud.com>

pkgname=apache-drill
pkgver=1.22.0
pkgrel=1
pkgdesc="Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage"
arch=(any)
url="https://drill.apache.org"
license=('Apache')
depends=('java-runtime')
source=("https://dlcdn.apache.org/drill/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "drill-embedded")
sha256sums=('21bb0087ead2487f31ef04dd1cd2f41eaacb147b4f9880f81737b4894a3db4e4'
            '017be05204b343c7dd3308370fc607f36934ab201a1b525fc51cff75b96b3a16')

package()
{
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    cp -r -t "${pkgdir}/opt/${pkgname}/" "bin/" "conf/" "jars/" "sample-data/" "KEYS" "LICENSE" "NOTICE" "README.md" "git.properties"
    rm -f ${pkgdir}/opt/${pkgname}/bin/*.bat
    chmod o+r "${pkgdir}/opt/${pkgname}/conf"/*

    cp "${srcdir}/drill-embedded" "${pkgdir}/usr/bin/drill-embedded"
    chmod 755 "${pkgdir}/usr/bin/drill-embedded"
}
