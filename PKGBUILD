# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.219.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('5f47f2494e200612c19270cc6a34c9096abd6f6af12d77cd8c743e4409e10aa97ed86a76de6a99d46399d76cf85b6b73d67d4abb06a836b7bb9dfecef235f118')
sha512sums_aarch64=('bf90f32ed2559afdde163f1fc4a59876d26fe9e9cf2f90bc1dd19f55ebce3d5846e181c6169d3906a2bc65670016e37bb282b4763faf65998192d3a93e64b485')
b2sums_x86_64=('ae6ae4a65590ddfeaa4c22933ff799498c0f4e9e69f4502910b60dc23910d1886eb439cb52f380d1f603fc65b32cd4cd0d94cb1085ebe820f65326f7d7199a81')
b2sums_aarch64=('1f858a70e692029ef26c0e845b3f4587918bb22673fdc4ef5da200b7d6eb83e36446bf40b61e6ee4759e97c87a24d7c4b6d0b7b88a86c3953c2c7a9aca5c9b9b')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
