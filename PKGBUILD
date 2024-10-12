# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gomp"
pkgname="${_pkgname}-bin"
pkgver=1.0.9
pkgrel=1
pkgdesc="MPD client inspired by ncmpcpp with builtin cover-art view and LastFM integration"
arch=('x86_64' 'aarch64')
url="https://github.com/aditya-K2/${_pkgname}"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
sha256sums=('8edef2883055725b00c9569c6117821c86403eaf62a9e3d9bf30def08250e97a'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('e165819b895628f2437489df277e238daf47e3fef9f2ca16194d59bf56d44724')
sha256sums_aarch64=('f8e1c439dd5192c0b5cf17715d9e015e8a58034f592c64cdfd72288d559dfd43')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
