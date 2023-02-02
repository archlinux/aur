# Maintainer: sunflowercx <1527981693@qq.com>
pkgname=zsh-kali-emoji-theme
pkgver=2.0
pkgrel=2
install=${pkgname}.install
pkgdesc="kali linux zshrc file with custom modify and add emoji"
arch=('x86_64')
url="https://gitlab.com/kalilinux/packages/kali-defaults/-/blob/kali/master/etc/skel/.zshrc"
license=('custom')
depends=('zsh' 'zsh-autosuggestions' 'zsh-syntax-highlighting' 'fastfetch')
optdepends=('noto-color-emoji-fontconfig: if emoji doesnt show correctly')
install=${pkgname}.install
source=("zshrc")
sha256sums=('7d7e282721e79c5a3d92751d61f880a6be370c57ae9a0ae76f8e46bfc738d8b1')
package(){
    echo "Warning: The next installation will overwrite zshrc.bak and zshrc"
    if [ -a "/etc/zsh/zshrc.bak" ];then
        echo "Error: File zshrc.bak is exist, the next installation will overwrite this file in order to create backup file, please remove current /etc/zsh/zshrc.bak or move it to other folder!"
        exit -1;
    fi

    if [ -a "/etc/zsh/zshrc" ];then
        echo "backup zshrc file"
        sudo mv "/etc/zsh/zshrc" "/etc/zsh/zshrc.bak"
    fi
    install -Dm644 "zshrc" -T "${pkgdir}/etc/zsh/zshrc"
}

