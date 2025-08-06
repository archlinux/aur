# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai-bin
_pkgname=fabric
_commit=7079c9c
pkgver=1.4.273
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
sha256sums_x86_64=('7e566d78096544ff4e4b4f5115e5c6f06e915beea28c98141bea9f4b6bc08a7e')
sha256sums_aarch64=('5922fef692162cf0d8e550f4fb4e48301b723a69652e5265d806d4789a730c3a')

noextract=("${source[@]##*/}")

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/fabric-ai"

  install -Dm644 "${pkgname}-${_commit}-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
