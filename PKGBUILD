# Maintainer: David Haller <haller_david@icloud.com>

pkgname=apache-drill
pkgver=1.21.2
pkgrel=1
pkgdesc="Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage"
arch=(any)
url="https://drill.apache.org"
license=('Apache')
depends=('java-runtime')
source=("https://dlcdn.apache.org/drill/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "drill-embedded")
sha256sums=('77e2e7438f1b4605409828eaa86690f1e84b038465778a04585bd8fb21d68e3b'
            '017be05204b343c7dd3308370fc607f36934ab201a1b525fc51cff75b96b3a16')

package()
{
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    cp -r -t "${pkgdir}/opt/${pkgname}/" "bin/" "conf/" "jars/" "sample-data/" "KEYS" "LICENSE" "NOTICE" "README.md" "git.properties"
    rm -f "${pkgdir}/opt/${pkgname}/bin/sqlline.bat"
    chmod o+r "${pkgdir}/opt/${pkgname}/conf"/*

    cp "${srcdir}/drill-embedded" "${pkgdir}/usr/bin/drill-embedded"
    chmod 755 "${pkgdir}/usr/bin/drill-embedded"
}
