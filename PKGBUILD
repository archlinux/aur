# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=nvm-fish
pkgver=1.0.0
pkgrel=1
pkgdesc="Fish shell wrapper for official nvm using bass - enables nvm commands in fish while preserving full compatibility with bash nvm installations"
arch=('any')
url="https://github.com/ChHsich/nvm-fish-aur"
groups=('fish-plugins')
license=('MIT')
depends=('nvm' 'fish' 'git')
makedepends=()
install="${pkgname}.install"
source=("nvm.fish"
        "nvm_find_nvmrc.fish"
        "load_nvm.fish"
        "bass_helper.fish")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    # 创建fish函数目录
    install -d "${pkgdir}/usr/share/fish/vendor_functions.d/"
    
    # 安装fish函数文件
    install -m644 "${srcdir}/nvm.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "${srcdir}/nvm_find_nvmrc.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "${srcdir}/load_nvm.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    install -m644 "${srcdir}/bass_helper.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/"
    
    # 创建bass本地编译目录（用于无插件管理器的情况）
    install -d "${pkgdir}/usr/share/nvm-fish/bass/functions"
}
