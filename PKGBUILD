# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=(usacloud_linux-386_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=(usacloud_linux-amd64_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('5340848f385b63f1edff83a526b7708a53b52d97dc4ff577a872dc2d8716e44e')
sha256sums_x86_64=('9bb6ee5438c87cc51157bed81dd081fd5ffd493c08f4151228e8c97b7d31002e')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin

    # completion
    mkdir -p ${pkgdir}/usr/share/bash-completion/completions
    ${pkgdir}/usr/bin/usacloud completion bash > ${pkgdir}/usr/share/bash-completion/completions/usacloud
    mkdir -p ${pkgdir}/usr/share/zsh/site-functions/
    ${pkgdir}/usr/bin/usacloud completion zsh > ${pkgdir}/usr/share/zsh/site-functions/_usacloud
    mkdir -p ${pkgdir}/usr/share/fish/vendor_completions.d/
    ${pkgdir}/usr/bin/usacloud completion fish > ${pkgdir}/usr/share/fish/vendor_completions.d/usacloud.fish
}
