# Maintainer: Josephine Pfeiffer <josie@redhat.com>

# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

# Note: Since this is a binary package, we cannot fix the following warnings:
# - ELF file lacks FULL RELRO (requires compilation with appropriate LDFLAGS)
# - ELF file is unstripped (binary is distributed this way)
# - ELF file lacks PIE (would need to be compiled with -fPIE)
# - ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK (CPU security feature)

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=2.1.1
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

sha256sums_x86_64=('301562c2fb96761f0a7c0747ec4c7b3b0cef60b63bc4ec5375cef98b0d5f0a5d')
sha256sums_s390x=('12de0d78d6197a40e5f5b494e35c30b28f76b41cef738202b40d85af21297e28')
sha256sums_arm64=('1129000ba3ddc5c6e5e108833043a0d558931992bac9b4643d81aa04797c6b64')
sha256sums_ppc64le=('9aff56bc66917a844143d7f09835500c376f8a33e85e744a7af19c12b2119b27')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
