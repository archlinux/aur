# Maintainer: czyt <czytcn@gmail.com>
pkgname=pinch-tab-bin
pkgver=0.15.2
pkgrel=2
pkgdesc="Browser control for AI agents"
arch=('x86_64' 'aarch64')
url="https://pinchtab.com"
license=('MIT')
depends=('glibc')
provides=('pinchtab')
conflicts=('pinchtab')
source=("LICENSE::https://raw.githubusercontent.com/pinchtab/pinchtab/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/pinchtab/pinchtab/releases/download/v${pkgver}/pinchtab-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/pinchtab/pinchtab/releases/download/v${pkgver}/pinchtab-linux-arm64")
sha256sums=('8e526b04f1f02203eebfd55aead0657a7ae87e0591cf8a44fbee19441aa0f116')
sha256sums_x86_64=('0bb4f97a1c92f94bcdbadffc39dc6985a4757c88a77876bbcb42142191e8202d')
sha256sums_aarch64=('e3343f84d1fffd430821eaa5d509ad454418a09b516b07eff81f6bb5266052ff')

package() {
    local _src
    case "$CARCH" in
        x86_64) _src="${pkgname}-${pkgver}-x86_64" ;;
        aarch64) _src="${pkgname}-${pkgver}-aarch64" ;;
    esac

    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/pinchtab"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
