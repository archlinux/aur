# Maintainer: Mniak <861c8ee6-f09e-40ea-bfb9-507a14ecc636 at anonaddy dot me>
_pkgname="git-credential-manager"
_reponame="Git-Credential-Manager-for-Mac-and-Linux"
pkgname="${_pkgname}-bin"
pkgver="2.0.4"
_tagname="${_pkgname}-${pkgver}"
pkgrel=3
pkgdesc="Git Credential Manager for Mac and Linux stores credentials for Git version control securely. Provides secure logon for Visual Studio Team Services (visualstudio.com)."
arch=("x86_64")
url="https://github.com/microsoft/${_reponame}"
license=("MIT")
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
depends=('java-environment>=6' 'git>=1.9')
source=(
    "${url}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.jar"
    "https://raw.githubusercontent.com/microsoft/${_reponame}/${_tagname}/templates/${_pkgname}"
)
sha256sums=(
    'fb8536aac9b00cdf6bdeb0dd152bb1306d88cd3fdb7a958ac9a144bf4017cad7'
    '661df4eaaca65b5f9d90398a05c301060730e1146275ba35e79cc308bc3a1579'
)

prepare() {
    sed -i s/'${version}'/${pkgver}/g ${_pkgname}
}

package() {
    install -D "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -D "${srcdir}/${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/lib/${_pkgname}-${pkgver}.jar"
}