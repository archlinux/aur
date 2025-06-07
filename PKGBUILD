# Maintainer: Josephine Pfeiffer <josie@redhat.com>

# Former Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

# Note: Since this is a binary package, we cannot fix the following warnings:
# - ELF file lacks FULL RELRO (requires compilation with appropriate LDFLAGS)
# - ELF file is unstripped (binary is distributed this way)
# - ELF file lacks PIE (would need to be compiled with -fPIE)
# - ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK (CPU security feature)

_pkgname=kube-burner

pkgname=kube-burner-bin
pkgver=1.16.1
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

sha256sums_x86_64=('b199c58ab30aa18bb96ff188c148c26e44538253bcf65f46aac65da5cf8a17d5')
sha256sums_s390x=('64cd09314a9027f40ca6d19fc3474a477fed7c358ca161eec4bfd512cb3bbf5f')
sha256sums_arm64=('f47f1f3c9af5d1aaeefbc779169583431e07dc1c9fb703fa91a8195b42b79ef9')
sha256sums_ppc64le=('37c2379690f9ed0545de37379ca52f41f0f5281341f863d517edb9fc94e2e99c')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
