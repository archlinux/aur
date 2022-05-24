# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=dojo
pkgver=0.10.1
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
  "https://github.com/kudulab/${pkgname}/releases/download/${pkgver}/${pkgname}_linux_amd64")
sha256sums=('445d1c72f0f764bea0bdebad180d9dc2255b6078e88c09bdd3ef7a99ee90a4d4'
            '813dd25448e9a3beeb195edcaf9798d16f957bf7ffbc05930e3bff2a85daf3aa')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}_linux_amd64 ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
