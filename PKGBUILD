# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: Ayatale <ayatale@qq.com>
# Contributor: sukanka <su975853527@gmail.com>

pkgname=openlist-bin
_pkgname=${pkgname%-bin}
pkgver=4.2.6
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
sha256sums_x86_64=('2f2a5008efe45895292018479cb05556c83e828c3eed68a8b8cd3d35e82f03cb')
sha256sums_aarch64=('eed743a0c3b9d67eb3b58b3e5455957a15eb2f4e199c06309fabdbfb0b571904')
sha256sums_loong64=('42db7fccda8b4ffc9cc6be505acda1cd25082f378b499267b8153185d429c653')
sha256sums_riscv64=('728d78d2f41b1cdb59fb3da715960a5bc5fba899cbac47af46858d72748baef4')


package() {
    install -Dm755 openlist ${pkgdir}/usr/bin/openlist
    install -Dm644 openlist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 openlist.sysusers ${pkgdir}/usr/lib/sysusers.d/openlist.conf
    install -Dm644 openlist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/openlist.conf
}
