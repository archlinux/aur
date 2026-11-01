# Maintainer: Ceaser Larry <ceaser.larry@gmail.com>
pkgname=redmine-cli-bin
pkgver=2.18.0
pkgrel=1
pkgdesc="Command-line interface for Redmine"
arch=('x86_64' 'aarch64')
url="https://github.com/aarondpn/redmine-cli"
license=('MIT')
depends=('glibc')
makedepends=()
optdepends=('bash-completion: bash completions'
            'zsh: zsh completions'
            'fish: fish completions')
provides=('redmine-cli')
conflicts=('redmine-cli')

source=("upstream-LICENSE::https://raw.githubusercontent.com/aarondpn/redmine-cli/v${pkgver}/LICENSE")
sha256sums=('c36401440220a687e7586f5b9af730a964ced9f672e004dea4d74013fa04f760')

source_x86_64=("redmine-cli-${pkgver}-linux-amd64.tar.gz::https://github.com/aarondpn/redmine-cli/releases/download/v${pkgver}/redmine-cli-linux-amd64.tar.gz")
sha256sums_x86_64=('1dac14712efa577b9d2dc996e9cd4ee9a2d46f2bfcc5b6075060ced881dc2232')

source_aarch64=("redmine-cli-${pkgver}-linux-arm64.tar.gz::https://github.com/aarondpn/redmine-cli/releases/download/v${pkgver}/redmine-cli-linux-arm64.tar.gz")
sha256sums_aarch64=('10acf3fe8442e3eafcc8b6e65d8fa742941ba9d366f4fd35411350d0a1b1bb60')

package() {
    cd "${srcdir}"

    install -Dm755 redmine "${pkgdir}/usr/bin/redmine"

    install -Dm644 completions/redmine.bash "${pkgdir}/usr/share/bash-completion/completions/redmine"
    install -Dm644 completions/redmine.zsh "${pkgdir}/usr/share/zsh/site-functions/_redmine"
    install -Dm644 completions/redmine.fish "${pkgdir}/usr/share/fish/vendor_completions.d/redmine.fish"

    install -Dm644 upstream-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
