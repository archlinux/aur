# Maintainer: lmartinez-mirror
# Contributor: desbma
pkgname=zoxide-bin
_pkgname=zoxide
pkgver=0.6.0
pkgrel=2
pkgdesc='A fast cd command that learns your habits (binary release)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
depends=('gcc-libs')
provides=('zoxide')
conflicts=('zoxide')
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-armv7-unknown-linux-gnueabihf")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu")
source=("https://raw.githubusercontent.com/ajeetdsouza/${_pkgname}/v${pkgver}/LICENSE")
sha512sums=('abf8fa83fc3e17f92046611974d837029da055eb53d5d17ac0453e6edef27ed172416376751be76833a2a54d28e1d173bb82635ff62ba51ebcca3733d51600c3')
sha512sums_x86_64=('c45938296b8737581bd31098658f41290735c77761a089aaf763f466d439911a3d623cd46c32513bde06deb8e92ff003d127928f8b1bcca684910296a81d07b8')
sha512sums_armv7h=('79a128a06f16507b915c6c60d9457220f265d6935ded48090d8514e88fdf9c4a805ffbcfd4a4e67b44bca68f7e418171c5a8c49babbaf5a1fbcab690892d23bc')
sha512sums_aarch64=('34017ce904c84f322ec7827422105500536d396bde73f245551819683137a3754c7b670830047a8c9efb14c70e933a82dd04c0d2450a98181bce7d69b2f582c8')
options=(strip)

package() {
  install -Dm 755 "${_pkgname}-$pkgver-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
