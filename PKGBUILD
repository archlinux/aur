# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=dojo

pkgname=dojo-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A tool to keep environment as code. Dojo helps to compile code and run other operations in Docker containers. Containerize your development and operations environment."
arch=('x86_64')
url="https://github.com//kubergrunt"
depends=('bash' 
         'docker' 
         'docker-compose'
          )
license=('Apache-2')
source=(
  "https://raw.githubusercontent.com/kudulab/dojo/${pkgver}/LICENSE.txt"
  "https://github.com/kudulab/${_pkggit}/releases/download/${pkgver}/${_pkggit}_linux_amd64")
sha256sums=('445d1c72f0f764bea0bdebad180d9dc2255b6078e88c09bdd3ef7a99ee90a4d4'
            'c1c0f4b715b0b02700d14b572ec577c36a7075463b11d7168e605656ef3dadaf')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit}_linux_amd64 ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkggit}/LICENSE"
}
