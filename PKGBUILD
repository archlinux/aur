# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.213.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('8ff0a6c0f61f8915aa50a4ca1782f30f7afe04bdbf487f60a127e8b40515bf3e5f235be5cf8f6c4094bcdb300361e25dc47faff539a8cc7de75c77f97ac260be')
sha512sums_aarch64=('0aa81b3412cfe529e6399829ec315be37b4c09b96ca067d5342507287a8b13e1cf9b63cbcb3b1b835530ed78be9e22a63386c0b0c3084a31ff2d46da4b16fe09')
b2sums_x86_64=('7838e17ce8672da06553437be1893b872901c2b4be0388fbb2637e539306b6eded61343281c9939d882477dd25682983adeeae220686ddbf100ef852e41c0cd1')
b2sums_aarch64=('41c57d717f2052e360deac641f82dc04820bffbdf770653353e38e07a218999b2ed37b9074d627344880be39846446284581e7281da61cfe87de8dafb4568611')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
