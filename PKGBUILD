# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, tar files
pkgver="1.4.1"
pkgrel=1
md5sums=(
  # .deb
  "dd059e57301d0d0dc9cc6135ac00110f"
)

# info
pkgname="minetime-bin"
pkgdesc="Modern, intuitive and smart calendar application."

_name=minetime
arch=("x86_64")
license=("unknown")
url="https://github.com/marcoancona/MineTime"

provides=("${_name}")
depends=("libsecret")
conflicts=("minetime")

source=(
  "${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb"
)

package() {
  tar -xJC "${pkgdir}" -f "${srcdir}/data.tar.xz"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/MineTime/${_name}" "${pkgdir}/usr/bin/${_name}"
}
