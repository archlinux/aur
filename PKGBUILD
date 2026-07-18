# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-riscv64-linux')

sha256sums_x86_64=('399a153c311424203a00f2f960da38eb8436e808e81bb457ab910520da94dce1')
sha256sums_aarch64=('57ffb699dde8c700a819727da12340599fe884d2f17f8492a9ef05490f94ec81')
sha256sums_powerpc64le=('3af6b96c5111b2727c0219673b3acfa7cde05a2e3265df41f5bcdc7b9da57903')
sha256sums_riscv64=('698675dd79d2d2df1e6a389b3eaa5c7079e63533ae080e8018af29efa1150c5a')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
