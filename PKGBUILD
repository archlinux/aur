# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lian-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="AI-powered Arch update auditor: reviews AUR PKGBUILD changes for supply-chain attacks, warns about upstream breaking changes, and summarizes -Syu results"
arch=('x86_64')
url="https://github.com/Yueosa/lian"
license=('MIT')
depends=(
    'pacman'
    'util-linux'
)
optdepends=(
    'paru: AUR update detection and PKGBUILD auditing (preferred)'
    'yay: AUR update detection and PKGBUILD auditing'
    'pacman-contrib: accurate update list via checkupdates, without root'
    'git: diff AUR PKGBUILD changes against the last built version'
)
provides=('lian')
conflicts=('lian' 'lian-git')
source=("lian-${pkgver}::https://github.com/Yueosa/lian/releases/download/v${pkgver}/lian_${pkgver}_linux_x86_64")
# 发布 v4.0.0 后在本目录运行 `updpkgsums` 自动填入真实校验和。
# 这里故意留占位值而非 SKIP：校验失败会明确报错，而 SKIP 会静默跳过完整性校验。
sha256sums=('29d93e80cef4b22ba029d0dd6ebed716318b913a05184f378faaa2de9af68452')

package() {
    install -Dm755 "lian-${pkgver}" "$pkgdir/usr/bin/lian"
}
