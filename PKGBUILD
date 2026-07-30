# Maintainer: gambhir <hey@gambhir.dev>
pkgname=keadm-bin
pkgver=1.23.1
pkgrel=1
pkgdesc="KubeEdge installer tool for setting up cloud and edge components (prebuilt binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://kubeedge.io"
license=('Apache-2.0')
depends=()
makedepends=()
options=(!strip !debug)
source_x86_64=("https://github.com/kubeedge/kubeedge/releases/download/v${pkgver}/keadm-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/kubeedge/kubeedge/releases/download/v${pkgver}/keadm-v${pkgver}-linux-arm64.tar.gz")
source_armv7h=("https://github.com/kubeedge/kubeedge/releases/download/v${pkgver}/keadm-v${pkgver}-linux-arm.tar.gz")
sha512sums_x86_64=('d25e287785858d113bca1f9f46c5c46bd239be9997365595df4d305520db8c9aba3177147fa96bd48a2e4c1ee8e25f99d4f4c50874909d826f2bbd3e5bac23cd')
sha512sums_aarch64=('c57b8cdb79780e81a10d75499a6f8f4d804b4871a828324a530e0edfc1a233af061f46b3a1fe07d1af3f493ec9c0382b8ed0627001d010e8f119405aaaccc9a7')
sha512sums_armv7h=('303029a452cd6292c076efd4a26e94a3d1dd6377c65f691a5041c7ae5e743fad57f73d32fe2a5c73ffa92cfb3e83a556b8a1ab6b50cbe54f512d327e216e9e21')

package() {
    cd "${srcdir}"
    local _arch
    case "${CARCH}" in
        x86_64)  _arch="amd64" ;;
        aarch64) _arch="arm64" ;;
        armv7h)  _arch="arm" ;;
    esac
    install -Dm755 "keadm-v${pkgver}-linux-${_arch}/keadm/keadm" "${pkgdir}/usr/bin/keadm"
}
