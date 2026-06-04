# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: Ayatale <ayatale@qq.com>
# Contributor: sukanka <su975853527@gmail.com>

pkgname=openlist-bin
_pkgname=${pkgname%-bin}
pkgver=4.2.2
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
sha256sums_x86_64=('c4781f22ffd6bc6854bfbc0ecba7b0aaf5e6cf416c9d36d87fb335df14ab8cb6')
sha256sums_aarch64=('04b2a4894c9228407e1a9b6cedefc7d6d948f1f07827878325c02462ae2274f3')
sha256sums_loong64=('ba66090bf77a77e2d6031da256fe3bbf6fa96f48703943f38689b23b90b02ce0')
sha256sums_riscv64=('38bf4130cbf1407b7b5b4ca77829549d356874e33c02254877802417af9850b3')


package() {
    install -Dm755 openlist ${pkgdir}/usr/bin/openlist
    install -Dm644 openlist.service -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm644 openlist.sysusers ${pkgdir}/usr/lib/sysusers.d/openlist.conf
    install -Dm644 openlist.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/openlist.conf
}
