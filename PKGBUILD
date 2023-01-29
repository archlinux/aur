# Maintainer: sunflowercx <1527981693@qq.com>
pkgname=zsh-kali-emoji-theme
pkgver=1.0
pkgrel=1
install=${pkgname}.install
pkgdesc="kali linux zshrc file with custom modify and add emoji"
arch=('x86_64')
url="https://gitlab.com/kalilinux/packages/kali-defaults/-/blob/kali/master/etc/skel/.zshrc"
license=('custom')
depends=('zsh' 'zsh-autosuggestions' 'zsh-syntax-highlighting' 'fastfetch-git')
optdepends=('noto-color-emoji-fontconfig: if emoji doesnt show correctly')
install=${pkgname}.install
source=("zshrc")
sha256sums=('e13b20bf7c3f8b7076ac0fb0d624ce38cf8afcf7522fec8bdd3f45a2e99b5941')
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

