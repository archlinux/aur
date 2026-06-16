# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alicloud-bin
pkgver=1.282.0
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
sha256sums_aarch64=('12aef09f00580d6a8e219345cc7ed295d5b8fa56c417553dcfe480fd6151e11c')
sha256sums_armv7h=('0f2c5e98e75fd665e87f5dbcf11b2f1b7c363328ed24bbc44749511365bd8c28')
sha256sums_i686=('11f5e85080f310025484d86385b622caf0d96580bd1f01312fc0d93598bbc96f')
sha256sums_x86_64=('75cd138f29602271d79b4900f83bd5def4f2c16ebe19fdd97bd0439b74901807')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
