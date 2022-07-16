 # Maintainer: wszqkzqk <wszqkzqk@qq.com>
 
 pkgname=easy-zsh-config
 pkgver=0.4.5
 pkgrel=1
 pkgdesc="A simple but fast and out of the box configuration of zsh powered by oh-my-posh and zsh pulgins."
 arch=(any)
 url=https://github.com/wszqkzqk/easy-zsh-config
 license=("MIT")
 conflicts=("grml-zsh-config"
            "manjaro-zsh-config")
 depends=(  "zsh"
            "oh-my-posh"
            "zsh-syntax-highlighting"
            "zsh-autosuggestions"
            "zsh-history-substring-search"
            )
optdepends=("nerd-fonts-noto: to showed the special characters needed by oh-my-posh (highly recommended but still optional)"
            "pkgfile: to provide a function that will automatically search the pkgfile database when entering an unrecognized command")
backup=("root/.zshrc"
        "etc/skel/.zshrc")
install="easy-zsh-config.install"
source=("zshrc"
        "LICENSE"
        "easy-zsh-config")
sha256sums=('67af6ec8e0e8f66a2c00d0f52c72416a3e3840edd5f399e6d8687f2f37d86c73'
            '191f93567e767c599cfd843bb8343f311396d8e80d423ec38af2ad3dc52551a3'
            '8562351200fbdabcd81d6f998bcd9ec2e2ecdd1d336bf23bf0656e387a75a23d')

package(){
    install -Dm644 zshrc "${pkgdir}/etc/skel/.zshrc"
    install -Dm644 zshrc "${pkgdir}/etc/zsh/zshrc"
    install -Dm640 zshrc "${pkgdir}/root/.zshrc"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 easy-zsh-config "${pkgdir}/usr/share/zsh/easy-zsh-config"
    chmod 750 "${pkgdir}/root"
}
