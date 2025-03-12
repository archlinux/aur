# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="pman"
pkgname="${_pkgname}-helper"
pkgver="1.2.0"
pkgrel="2"
pkgdesc="A pacman helper script, because you forget all the stupid flags"
url="https://git.bjphoster.com/source/${_pkgname}"
arch=("any")
license=("MIT")
depends=("bash" "pacman")
conflicts=("pman") # Another package called `pman` currently exists in the AUR
source=("https://git.bjphoster.com/source/${_pkgname}/archive/${pkgver}.tar.gz")

sha1sums=("df1f0c0d476619fa6994c72c94f0fd50e08fa74c")
sha256sums=("400980f9d8e4d8df3f95cf8c7430922586ba389289a80d0ba18d127f095d1d84")
md5sums=("5b424b1b6900b4f8cdcd8a5388be55aa")

package() {
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/pman.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
