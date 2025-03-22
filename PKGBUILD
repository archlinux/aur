# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai-bin
_pkgname=fabric
_commit=7079c9c
pkgver=1.4.164
pkgrel=1
pkgdesc="open-source framework for augmenting humans using AI (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
provides=('fabric-ai')
conflicts=('fabric-ai')

source=("${pkgname}-${_commit}-license::${url}/raw/${_commit}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")

sha256sums=('42b554b17b8fd7ae4d6bc488f0857ae91d9179f04db3da466c2fc5425686f4f9')
sha256sums_x86_64=('360385f5d944bdd847dea1e1f3684194ed74131e7ac634d60bf7bc0b2d6aa38a')
sha256sums_aarch64=('ba061cc082c35f33533f2de9f85ab7da07d5a2ce0e16373b8fdc532f57ca99f4')

noextract=("${source[@]##*/}")

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fabric-ai"

  install -Dm644 "${pkgname}-${_commit}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
