# Contributor: WangGithubUser
# Maintainer: FTS427 <FTS427@outlook.com>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m> 
pkgname='fastgithub-bin'
_pkgName='fastgithub'
pkgver=2.1.5
pkgrel=2
pkgdesc="Speedup github access in China"
arch=('x86_64' 'aarch64')
url="https://github.com/WangGithubUser/FastGitHub"
_url="https://slink.ltd/${url}"
license=('MIT')
depends=('zlib' 'glibc' 'gcc-libs')
options=('!strip')
provides=('fastgithub')
install="${pkgname}.install"
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgName}_linux-x64.zip")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgName}_linux-arm64.zip")
sha256sums_x86_64=('f4e9caa10bf31f9245610bf5770b26ec8c13eb11337d11bc66bbabc5ddefabf2')
sha256sums_aarch64=('f17ffdb8ac34c64cc31a82b5a93ee904c49ba8629e9e968022b5ea4a019754db')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses"
    cp -a "${srcdir}/${_pkgName}_linux-x64/"* "${pkgdir}/opt/${pkgname}"
    
    chmod 755 "${srcdir}/${_pkgName}_linux-x64/${_pkgname}" "${pkgdir}/opt/${pkgname}/${_pkgname}"
    chmod 755 "${srcdir}/${_pkgName}_linux-x64/dnscrypt-proxy/dnscrypt-proxy" "${pkgdir}/opt/${pkgname}/dnscrypt-proxy/dnscrypt-proxy"
    
    ln -s "/opt/${pkgname}/${_pkgName}" "${pkgdir}/usr/bin/${_pkgName}"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    ln -s "/opt/${pkgname}/dnscrypt-proxy/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/dnscrypt-proxy_LICENSE"
}
