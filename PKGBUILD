# Maintainer: Arghya Sarkar <arghyasarkar.nolan@gmail.com>
pkgname=hydra-bin
_pkgname=hydra-bin
_destname="/usr/bin/"
_licensedir="/usr/share/licenses/${_pkgname}/"
_readmedir="/usr/share/doc/${_pkgname}/"
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc=""
arch=('x86_64')
url="https://www.github.com/Shravan-1908/hydra.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(hydra)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source_x86_64=("hydra::https://github.com/Shravan-1908/hydra/releases/download/v2.2.0/hydra-linux-amd64"
               "https://raw.githubusercontent.com/Shravan-1908/hydra/main/LICENSE"
               "https://raw.githubusercontent.com/Shravan-1908/hydra/main/README.md"
              )
noextract=("bench")
sha256sums_x86_64=('d040ee8ef4122ea20768ca026660227aa28cabdfb0a1ee2efb61492d95eb8f5e'
                   'da95d588c7c8b81746069efcafaaab40e81a5a007a1765e5b51ce8cc12d5ed8c'
                   'd8e76ac3832063259afde8dd0f000751d3a9f0d44ae7d9372c492a13788c722c')
validpgpkeys=()

# pkgver() {
# 	# cd "${_pkgname}"
#     # printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# }

package() {
    install -dm755 ${pkgdir}${_destname}
    install -Dm755 "${srcdir}/hydra" "${pkgdir}${_destname}hydra"

    install -dm755 ${pkgdir}${_licensedir}${_pkgname}
    install -dm755 ${pkgdir}${_readmedir}${_pkgname}
	install -m644  ${srcdir}/LICENSE ${pkgdir}${_licensedir}${_pkgname}
    install -Dm644 ${srcdir}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
