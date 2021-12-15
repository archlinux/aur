# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
_pkgname=${pkgname%-bin}
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.60.1
pkgrel=1
arch=(aarch64 armv6h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha512sums=('e0dad6ee4d0c0d1af62dc4a05e8df3dfb11657cbf6f71513f1e867232d4ea689f8c794b899c582753cd1184d84245a320f7705f30f46f2f919a8af7ee7076da8')
sha512sums_aarch64=('f7f394a940bf6bc6eb5eb3fe400d5ef350976752cf372f728ee11bb5a769ef9175fced2a212a10eafae6a3332ec1d142c2759ade8deadee2bba2a2344a57ad4a')
sha512sums_armv6h=('244fd6ae57305df811a7695016b5709cc52aad5ff301f0bfc6944813e3fcbf032245eef035aedb8be2d235447f20d493d2b4df3e6b0a9407d46fa16c301262ce')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
