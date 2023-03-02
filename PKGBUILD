# Maintainer: denisse <aur at denisse dot dev>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
_pkgname=${pkgname%-bin}
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=4.12.1
pkgrel=1
arch=(aarch64 armv6h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha512sums=('b06915587e3f5b156c3a94b34d801a73a45e74e520e3335724530f80645feb0e3d09297383c76472ca67ff0a929edee1456fc7f205deed739ae3fe94af6f9882')
sha512sums_aarch64=('a821ba92d8bc018c475ade6b12d23a246e70a46de308a2ff62196d8aac5405cfd8ab1d3b52d38d410aa8eb3aa436420a3db04f324df04d5a3d043758fd11ac62')
sha512sums_armv6h=('aadd8877bf54394f0763a761a3fedf19fce2111c99c0ca8bcf3f65b207878e27aefb7042209fbc4d633add097f564b97e6b46cc3dd366c8ff0390a036e25fffa')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
