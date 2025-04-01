# Maintainer: Josephine Pfeiffer <josie@redhat.com>

# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

# Note: Since this is a binary package, we cannot fix the following warnings:
# - ELF file lacks FULL RELRO (requires compilation with appropriate LDFLAGS)
# - ELF file is unstripped (binary is distributed this way)
# - ELF file lacks PIE (would need to be compiled with -fPIE)
# - ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK (CPU security feature)

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.15.0
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

sha256sums_x86_64=('44a8a436f9b8dfe4597055b462f0857d97b0d22408821f67a24065139aa1cfa9')
sha256sums_s390x=('050b6422cbe992ec25f4829eb9f20e511b6124adca3c6b70756718308b1317ed')
sha256sums_arm64=('0b3756a685a325f299b609deb590c17edc59ef8e2631faf535c3acee31c2f9b5')
sha256sums_ppc64le=('5ee75eb69eff37b849b856036febfd5a38cfada4f59ccf698fa51a5b02edeb85')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
