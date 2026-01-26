# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alicloud-bin
pkgver=1.269.0
pkgrel=1
pkgdesc="Terraform AliCloud provider.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.terraform.io/docs/providers/alicloud/"
_ghurl="https://github.com/aliyun/terraform-provider-alicloud"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('terraform')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('edd159445e987eb868179244d31d16ea386a0e2ab53651bed292ab4fb736d16b')
sha256sums_armv7h=('a82c86ff98248e0ddf6e06e78f61e6a6de4fd36e800f0fc45b2b594e966a0b83')
sha256sums_i686=('904ce0d144eec8824a49878a37e3582c7a603cb90cd3f416235fbe02b91f5417')
sha256sums_x86_64=('111f68fe629e034406aa6119bfcd5c5fe1e62222296d267f92090132154ed5e5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
