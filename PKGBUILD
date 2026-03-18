# Maintainer: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>

pkgname=subtui-bin
_pkgname=SubTUI
pkgver=2.12.2
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
sha256sums_x86_64=('d0f804a3f2bfde5e16cf9b7d47a6efa26a410ceef11024eee4e95aaa0498e324'
                   'e05b298099458d6d08933e0c3c0bdd0eb530b837cbce10514ecaf4b601b044c2')
sha256sums_aarch64=('27085bbc76ef77661030a620f11fedfe764382ea69da62bed9378cbcc3fd2b59'
                    'e05b298099458d6d08933e0c3c0bdd0eb530b837cbce10514ecaf4b601b044c2')

prepare() {
  tar -xf data.tar.gz
}

package() {
  install -Dm755 "${srcdir}/usr/bin/subtui" "$pkgdir/usr/bin/subtui"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

