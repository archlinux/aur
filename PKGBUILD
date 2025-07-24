# Maintainer: insmtr <insmtr@insmtr.cn>
# Maintainer: Ayatale <ayatale@qq.com>
# Maintainer: sukanka <su975853527@gmail.com>

pkgname=openlist-bin
_pkgname=${pkgname%-bin}
pkgver=4.0.9
pkgrel=1
pkgdesc="A new AList Fork to Anti Trust Crisis"
arch=("aarch64" "x86_64")
url="https://github.com/OpenListTeam/OpenList"
license=('AGPL-3.0-only')
provides=(${_pkgname})
conflicts=('openlist')
backup=("etc/openlist/config.json")
optdepends=('aria2: download by aria2.')
source=("openlist.service" "config.json" "openlist.sysusers" "openlist.tmpfiles")
install=openlist.install
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-amd64.tar.gz")
options=(!debug)
sha256sums=('4bc1ccc08f17f5c9ce0fe7fc600ea9d5e1b034d52a776244c627bc13a3fa401d'
            '9259caae294aebb88e0e25f83074e090f3581556c05548544739edf88c028537'
            'fe9c68aa8a6a27477049c839cb5818ba3ddbd88c6813dd2eacea73da70807905'
            'e4f341a876f43b551b67b730aa93dc3a8d2e5f6863ca234852a4389aa64c0aca')
sha256sums_aarch64=('cde99dc04e7e958cf57914cd0f2d96145910eea7edea8809aad017fa5c93587c')
sha256sums_x86_64=('9e34354f883d16fbf9b27c2155578c2fae067581ec1e3d3868cd7a2aaa2c4f3f')

package() {
    install -Dm755 openlist ${pkgdir}/usr/bin/openlist
    install -Dm644 openlist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/openlist
    install -Dm644 openlist.sysusers ${pkgdir}/usr/lib/sysusers.d/openlist.conf
    install -Dm644 openlist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/openlist.conf
}
