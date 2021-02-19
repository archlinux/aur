# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=(usacloud_linux-386_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=(usacloud_linux-amd64_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('2c87f108331fb90105d77665b2b4d2c7980dc55fc5c9d15656edbd2586a37e2c')
sha256sums_x86_64=('5d9796ac65212b36a403d26c5eb3f78603c48dd0cf0a7208affc01bc26046dd2')


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
