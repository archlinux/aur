# Maintainer: Arghya Sarkar <arghyasarkar.nolan@gmail.com>
pkgname=fm6000-bin
_pkgname=fm6000-bin
_destname="/usr/local/bin/"
_licensedir="/usr/share/licenses/${_pkgname}/"
_readmedir="/usr/share/doc/${_pkgname}/"
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="Fetch Master 6000 is yet another simple petching tool to add bling to your terminal"
arch=('x86_64')
url="https://github.com/anhsirk0/fetch-master-6000"
license=('GPL3')
groups=()
depends=(perl)
makedepends=()
checkdepends=()
optdepends=()
provides=(fm6000)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source_x86_64=("fm6000::https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/fm6000.pl"
               "https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/LICENSE"
               "https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/README.md"
              )
noextract=("fm6000")
sha256sums_x86_64=('3a9ef9e7a4a81f4748ab54df1e0568bbe7d154766ba54b284b63a2bdbff21eb4'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
                   'ca55252a984e00c0d9d6079f9a949dc10b3a147e6fc68558938bcdbe519c99bb')
validpgpkeys=()

# pkgver() {
# 	# cd "${_pkgname}"
#     # printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# }

package() {
    install -dm755 ${pkgdir}${_destname}
    install -Dm755 "${srcdir}/fm6000" "${pkgdir}${_destname}fm6000"

    install -dm755 ${pkgdir}${_licensedir}${_pkgname}
    install -dm755 ${pkgdir}${_readmedir}${_pkgname}
	install -m644  ${srcdir}/LICENSE ${pkgdir}${_licensedir}${_pkgname}
    install -Dm644 ${srcdir}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
