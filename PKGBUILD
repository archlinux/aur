# Maintainer: Arghya Sarkar <arghyasarkar.nolan@gmail.com>
pkgname=bench-bin
_pkgname=bench-bin
_destname="/usr/bin/"
_licensedir="/usr/share/licenses/${_pkgname}/"
_readmedir="/usr/share/doc/${_pkgname}/"
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="bench is a simple CLI tool for making benchmarking easy, efficient and accurate."
arch=('x86_64')
url="https://www.github.com/Shravan-1908/bench.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(bench)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source_x86_64=("bench::https://github.com/Shravan-1908/bench/releases/download/v0.3.0/bench-linux-amd64"
               "https://raw.githubusercontent.com/Shravan-1908/bench/master/LICENSE"
               "https://raw.githubusercontent.com/Shravan-1908/bench/master/README.md"
              )
noextract=("bench")
sha256sums_x86_64=('641427383e9daa952ef952c422e78abcd314ea60ea8019f586231746e2a8fe65'
                   '7040e980ba101dcf6657dd99c8c41e43341640a28693e73aa51b317a77841e2f'
                   'b209cae97414045af01e980c1e9c1f1b8681c4e0929579410df676de4facf3ab')
validpgpkeys=()

# pkgver() {
# 	# cd "${_pkgname}"
#     # printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# }

package() {
    install -dm755 ${pkgdir}${_destname}
    install -Dm755 "${srcdir}/bench" "${pkgdir}${_destname}bench"

    install -dm755 ${pkgdir}${_licensedir}${_pkgname}
    install -dm755 ${pkgdir}${_readmedir}${_pkgname}
	install -m644  ${srcdir}/LICENSE ${pkgdir}${_licensedir}${_pkgname}
    install -Dm644 ${srcdir}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
