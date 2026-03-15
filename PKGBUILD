# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=opencl-vanity-gpg
pkgname=$_pkgname-bin
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Rusty GPU/OpenCL-powered vanity PGP keys generator (Binary from GitHub release)"
arch=("x86_64")
depends=('ocl-icd')
optdepends=('opencl-driver: OpenCL implementation')

url="https://github.com/TransparentLC/opencl_vanity_gpg"
license=('AGPL-3.0')

source=(
"https://github.com/TransparentLC/opencl_vanity_gpg/releases/download/v$pkgver/opencl_vanity_gpg-x86_64-unknown-linux-gnu.zip"
"https://raw.githubusercontent.com/TransparentLC/opencl_vanity_gpg/refs/tags/v$pkgver/README.md"
"https://raw.githubusercontent.com/TransparentLC/opencl_vanity_gpg/refs/tags/v$pkgver/LICENSE"
)

sha256sums=(
"6991e5a092fd6907fa6bbc8a0a98678acacf653c6ca5defcb99e59d539b4dfd2"
"d467f85861938f6a38174194d0ef6060a707a5d80683d54521d2a79016e812cb"
"8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef"
)

package() {
    install -Dm0755 "${srcdir}/opencl_vanity_gpg" "${pkgdir}/usr/bin/opencl_vanity_gpg"
    install -Dm0644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
