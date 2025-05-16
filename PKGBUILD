# Maintainer: Josephine Pfeiffer <josie@redhat.com>

# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

# Note: Since this is a binary package, we cannot fix the following warnings:
# - ELF file lacks FULL RELRO (requires compilation with appropriate LDFLAGS)
# - ELF file is unstripped (binary is distributed this way)
# - ELF file lacks PIE (would need to be compiled with -fPIE)
# - ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK (CPU security feature)

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.16.0
pkgrel=1
pkgdesc='Kubernetes performance and scale test orchestration framework written in golang.'
arch=('x86_64' 's390x' 'arm64' 'ppc64le')
url='https://github.com/kube-burner/kube-burner'
license=('Apache-2.0')
provides=('kube-burner-bin')
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-$CARCH.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-$CARCH.tar.gz")
source_s390x=("${_pkgname}-${pkgver}-s390x.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-s390x.tar.gz")
source_arm64=("${_pkgname}-${pkgver}-arm64.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-arm64.tar.gz")
source_ppc64le=("${_pkgname}-${pkgver}-ppc64le.tar.gz::https://github.com/kube-burner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-V${pkgver}-linux-ppc64le.tar.gz")

sha256sums_x86_64=('37457467f9a67fe782db4a83f73f31e29e40a28735c5976186e8732a5a4bc113')
sha256sums_s390x=('8009891e995573cd77161f5b547431ac2b6455c92c53a1dbb50b19f47dd48dd8')
sha256sums_arm64=('ec05baee62ef6091a4f1dc047970529621ce20f499e75bec0f44e5525373951e')
sha256sums_ppc64le=('ce9fa272246542d0d3f559b62fa064c03237dd8b95b1ed154aaa56a4cb99acb6')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
