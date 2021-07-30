# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=(usacloud_linux-386_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=(usacloud_linux-amd64_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('efaa6e0afa4fec778a789695324da9776141e9de97d1683d7dc1230a7c58bc67')
sha256sums_x86_64=('375089083b7cd24693df3556bd57df07cb83e92a740e4c7d52b26e1cf8186a37')


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
