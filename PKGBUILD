# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: Ayatale <ayatale@qq.com>
# Contributor: sukanka <su975853527@gmail.com>

pkgname=openlist-bin
_pkgname=${pkgname%-bin}
pkgver=4.1.2
pkgrel=1
pkgdesc="A new AList Fork to Anti Trust Crisis"
arch=("x86_64" "aarch64" "loong64" "riscv64")
url="https://github.com/OpenListTeam/OpenList"
license=('AGPL-3.0-only')
provides=(${_pkgname})
conflicts=('openlist')
backup=("etc/openlist/config.json")
optdepends=('aria2: download by aria2.')
source=("openlist.service" "config.json" "openlist.sysusers" "openlist.tmpfiles")
install=openlist.install
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-arm64.tar.gz")
source_loong64=("$_pkgname-$pkgver-loong64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-loong64.tar.gz")
source_riscv64=("$_pkgname-$pkgver-riscv64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-riscv64.tar.gz")
options=(!debug)
sha256sums=('4bc1ccc08f17f5c9ce0fe7fc600ea9d5e1b034d52a776244c627bc13a3fa401d'
            '9259caae294aebb88e0e25f83074e090f3581556c05548544739edf88c028537'
            'fe9c68aa8a6a27477049c839cb5818ba3ddbd88c6813dd2eacea73da70807905'
            'e4f341a876f43b551b67b730aa93dc3a8d2e5f6863ca234852a4389aa64c0aca')
sha256sums_x86_64=('9e92e751ad920907cb7f950806d0b235ee9dd311820ad7048f5f1ab220de5905')
sha256sums_aarch64=('8d37d28529b960aa8f6a6c271c3f098622b66a869a4bd2cb1c7999204271af25')
sha256sums_loong64=('a3c57bf752666c4ebb60799e7031e79d558b5fdd052b2dcd7a060bc93668181a')
sha256sums_riscv64=('2a18b84e7970cafd99ef33416f71e3f5d3676be7cde2837f6f3cc3a5ed420ad6')


package() {
    install -Dm755 openlist ${pkgdir}/usr/bin/openlist
    install -Dm644 openlist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 config.json -t ${pkgdir}/etc/openlist
    install -Dm644 openlist.sysusers ${pkgdir}/usr/lib/sysusers.d/openlist.conf
    install -Dm644 openlist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/openlist.conf
}
