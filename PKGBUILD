# Maintainer: Jonathan Sumner Evans <sumner.evans98@gmail.com>

pkgname="zsh-you-should-use"
pkgver=0.4.1
pkgrel=1
pkgdesc="ZSH plugin that reminds you to use existing aliases for commands you just typed"
url="https://github.com/MichaelAquilina/zsh-you-should-use"
arch=("any")
license=("MIT")
source=("https://github.com/MichaelAquilina/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("7af71b463d998fa2388a4dd52ea75ce9ee1568cf233c8b2e41b690b04e250b40")

package() {
    install -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/you-should-use.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

    # License
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    cat << EOF
To activate zsh-you-should-use add the following line at the end of ~/.zshrc:
    source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
EOF
}
