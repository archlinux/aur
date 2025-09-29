# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=nvm-fish
pkgver=1.1.2
pkgrel=1
pkgdesc="Fish shell wrapper for official nvm using bass - enables nvm commands in fish while preserving full compatibility with bash nvm installations"
arch=('any')
url="https://github.com/ChHsiching/nvm-fish-aur"
groups=('fish-plugins')
license=('MIT')
depends=('nvm' 'fish' 'git')
makedepends=()
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/ChHsiching/nvm-fish-aur.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    # 创建fish函数目录
    install -d "${pkgdir}/usr/share/fish/vendor_functions.d/"

    # 安装fish函数文件
    install -m644 "${srcdir}/${pkgname}/nvm.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "${srcdir}/${pkgname}/nvm_find_nvmrc.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "${srcdir}/${pkgname}/load_nvm.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "${srcdir}/${pkgname}/bass_helper.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"

    # 创建bass本地编译目录（用于无插件管理器的情况）
    install -d "${pkgdir}/usr/share/nvm-fish/bass/functions"
}
