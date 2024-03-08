# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=dojo

pkgname=dojo-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A tool to keep environment as code. Dojo helps to compile code and run other operations in Docker containers. Containerize your development and operations environment."
arch=('x86_64')
url="https://github.com//kubergrunt"
depends=('bash' 
         'docker' 
         'docker-compose'
          )
conflicts=('dojo')
provides=('dojo')
license=('Apache-2')
source=(
  "https://raw.githubusercontent.com/kudulab/dojo/${pkgver}/LICENSE.txt"
  "https://github.com/kudulab/${_pkggit}/releases/download/${pkgver}/${_pkggit}_linux_amd64")
sha256sums=('445d1c72f0f764bea0bdebad180d9dc2255b6078e88c09bdd3ef7a99ee90a4d4'
            '874c9d8b3e55cfd05e56ea4f215c0eb5951e4b45f6dc7f2bbc8fea817894d910')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit}_linux_amd64 ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkggit}/LICENSE"
}
