# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai-bin
_pkgname=fabric
_commit=7079c9c
pkgver=1.4.156
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
sha256sums_x86_64=('6cc7779e7c82e26013005c60c949c65b20a5317d06ac9ffc4675242729fe3905')
sha256sums_aarch64=('566f12cae5d81f025b42b19a4b5bfda0d21c336d4d7cc21ad1111d1830751a8a')

noextract=("${source[@]##*/}")

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fabric-ai"

  install -Dm644 "${pkgname}-${_commit}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
