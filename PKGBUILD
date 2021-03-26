# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=(usacloud_linux-386_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=(usacloud_linux-amd64_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('77c574f1b926d8c0161fdc2afcd97350a08b9815c5f902689a8f8b1107930e24')
sha256sums_x86_64=('baa336fe993ba04f7a8874830228e37bcbdd905b618eea79e06cbc3ed600ca2a')


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
