# Maintainer: Josephine Pfeiffer <josie@redhat.com>

# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

# Note: Since this is a binary package, we cannot fix the following warnings:
# - ELF file lacks FULL RELRO (requires compilation with appropriate LDFLAGS)
# - ELF file is unstripped (binary is distributed this way)
# - ELF file lacks PIE (would need to be compiled with -fPIE)
# - ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK (CPU security feature)

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.16.2
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

sha256sums_x86_64=('3799d8e5e7a177e19d6aa9a69de417dcfa604de760f60db018affc1c9535f49e')
sha256sums_s390x=('0b7df5bca750f6e205860fb447dd9cca5844634edc64c796301e5091210ece55')
sha256sums_arm64=('1fc60d81263ba4c1a2ca105cff1620df387a00ef3e9d9388dd95b8ad55749a4c')
sha256sums_ppc64le=('3f13eaf8dc0825ccd4f0ce70d73459000fec28572fcf1a10ed83ed6191fa7e34')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
