# Maintainer: Parham <parham at tuta dot io>

pkgname=icu4j
pkgver=68.2
pkgrel=1
pkgdesc="International Components for Unicode for Java"
arch=('any')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('java-environment>=7')
_ghurl="https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}"
source=("${_ghurl}/${pkgname}-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-${pkgver//./_}-docs.jar"
        "${_ghurl}/${pkgname}-${pkgver//./_}-src.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-charset-${pkgver//./_}-src.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver//./_}.jar"
        "${_ghurl}/${pkgname}-localespi-${pkgver//./_}-src.jar"
        "${pkgname}-license::https://github.com/unicode-org/icu/blob/master/icu4c/LICENSE")
noextract=("${pkgname}-${pkgver//./_}.jar"
           "${pkgname}-${pkgver//./_}-src.jar"
           "${pkgname}-charset-${pkgver//./_}.jar"
           "${pkgname}-charset-${pkgver//./_}-src.jar"
           "${pkgname}-localespi-${pkgver//./_}.jar"
           "${pkgname}-localespi-${pkgver//./_}-src.jar")
sha256sums=('9bd7bf869a44ba8aeb0cddd7e6616e88cd4795ba5bfce2230447cb0e185a646c'
            '994b357616ddaf5ab9aa493caf1d213401071eb6d865bc2ad49e943c544d6884'
            'b02680befb4cabca9ab3637025496362f312da8a215097f749d7e432ea0889b4'
            'de161cbface844b66e0577e794332af2fbca65a7cb1e4c286da145598decdc51'
            'ea5e9c413ba8ed36583d661f9a6a66819952eccdb1898ef122aefe9d837fbc4c'
            '07d1b869732c44d564048bddebb4a632b87aa3ed999c328971bef915982f3f6d'
            'fdc6668d5ee97a45903e65d5d87c799dc2864b40ad1b3242f485f27f230776ec'
            'SKIP')

package() {
    install -d ${pkgdir}/usr/share/{doc,java,licenses}/${pkgname}
    cp ./icu4j*.jar "${pkgdir}/usr/share/java/${pkgname}/"
    cp -a ./{com,*.{html,css,js}} "${pkgdir}/usr/share/doc/${pkgname}/"
    cp "./${pkgname}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=4 et:
