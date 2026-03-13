# Maintainer: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>

pkgname=subtui-bin
_pkgname=SubTUI
pkgver=2.11.1
pkgrel=1
pkgdesc="Lightweight TUI music player for Subsonic-compatible servers"
arch=('x86_64' 'aarch64')
url="https://github.com/MattiaPun/SubTUI"
license=('MIT')
depends=('mpv')
provides=('subtui')
conflicts=('subtui' 'subtui-git')
source_x86_64=(
    "${_pkgname}_${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MattiaPun/SubTUI/v${pkgver}/LICENSE"
)
source_aarch64=(
    "${_pkgname}_${pkgver}_linux_arm64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MattiaPun/SubTUI/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
    '8ab85f0e8ad2067390738a0e920957b942b421e32cd3b1582263abc5060113ea'
    'SKIP'
)
sha256sums_aarch64=(
    '1f1f61ac5f5ac91bfd5cf1edf5ade5b9d0cc9ec41dfa60fe0f394416577af22c'
    'SKIP'
)

prepare() {
  tar -xf data.tar.gz
}

package() {
  install -Dm755 "${srcdir}/usr/bin/subtui" "$pkgdir/usr/bin/subtui"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

