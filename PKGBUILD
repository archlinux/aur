# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: Ayatale <ayatale@qq.com>
# Contributor: sukanka <su975853527@gmail.com>

pkgname=openlist-bin
_pkgname=${pkgname%-bin}
pkgver=4.2.3
pkgrel=1
pkgdesc="A new AList Fork to Anti Trust Crisis"
arch=("x86_64" "aarch64" "loong64" "riscv64")
url="https://github.com/OpenListTeam/OpenList"
license=('AGPL-3.0-only')
provides=(${_pkgname})
conflicts=('openlist')
backup=("var/lib/openlist/config.json")
optdepends=('aria2: download by aria2.')
source=("openlist.service" "openlist.sysusers" "openlist.tmpfiles")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-arm64.tar.gz")
source_loong64=("$_pkgname-$pkgver-loong64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-loong64.tar.gz")
source_riscv64=("$_pkgname-$pkgver-riscv64.tar.gz"::"${url}/releases/download/v${pkgver//_/-}/openlist-linux-riscv64.tar.gz")
options=(!debug)
sha256sums=('4bc1ccc08f17f5c9ce0fe7fc600ea9d5e1b034d52a776244c627bc13a3fa401d'
            'fe9c68aa8a6a27477049c839cb5818ba3ddbd88c6813dd2eacea73da70807905'
            'e2121760e533763ef0984c0891e2a175dc3b4a0ddb2005c6a9b45321d93d9bcb')
sha256sums_x86_64=('3b389f1be299cdafc7b568b941530bf74420dfaa8c04198e47189ef0d3574b8a')
sha256sums_aarch64=('69756adb48e436b1b0ef40228ff33583902548daf08b2e0e6715a022d1373a16')
sha256sums_loong64=('d4cf793492983882db3493e5600782df23f72d78b99c780c352d41977d24b625')
sha256sums_riscv64=('f125558a3059c237e82d4f7ffb42d53c09ccc0db3ea0a94ba33f6d070e4402c0')


package() {
    install -Dm755 openlist ${pkgdir}/usr/bin/openlist
    install -Dm644 openlist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 openlist.sysusers ${pkgdir}/usr/lib/sysusers.d/openlist.conf
    install -Dm644 openlist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/openlist.conf
}
