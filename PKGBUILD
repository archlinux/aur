# Maintainer: Brуan Childs <godeater[at]𝚐mail[dot]com>
# Co-Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
pkgname=atmos-bin
pkgver=1.220.0
pkgrel=1
pkgdesc='Automated Terraform Management & Orchestration Software (ATMOS)'
arch=(x86_64 aarch64)
url=https://github.com/cloudposse/atmos
license=('Apache-2.0')
optdepends=('terraform'
            'opentofu')
source_x86_64=("${pkgname/-bin/}_${pkgver}_linux_amd64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname/-bin/}_${pkgver}_linux_arm64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64")
sha512sums_x86_64=('210979d57ce35e3c676db67ca4d402d8c78f7bdbae6c2865cc22fcea3eb85140021f7762238adceed945fc048eb3c097402bbf9da173e743495b4e4b25e633fa')
sha512sums_aarch64=('1b1e4b389ffefd519e6ae3f50506c72ab05b03dbc53fccf632d034b60ad05023bb0c804904bc9f704244a208b779257e2d5078349adef84328ae4e12f97b901b')
b2sums_x86_64=('578d3626ea276d7f209a41e9c8636fb38fd5a4680bf5ed76b177fce642cd1782dd4a04058350e12c490613300111b155a4fb6eff0f131275cf20498578ab9af8')
b2sums_aarch64=('ba9d35a1a97dc6a6de1f95d3b5c9fb42e09c5991eed89696a0558582d414fe11bb2e633ef9369a8a3a35f9345070c8919d4cf45559c5729de05b0823503dff53')

package() {
  local _srcarch='amd64'

  [[ "${CARCH}" == 'aarch64' ]] && _srcarch='arm64'

  install -Dm755 \
    "${srcdir}/${pkgname/-bin/}_${pkgver}_linux_${_srcarch}" \
    "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
