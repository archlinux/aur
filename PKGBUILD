# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=(usacloud_linux-386_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=(usacloud_linux-amd64_${pkgver}.zip::"${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('344ca31b4708769fdde2fca9df07facfb16b131ad862ddb7529f69860a4dbc73')
sha256sums_x86_64=('55b347a9b16df9d0aaa7bc4a48a7f9731b163c6584a3a0b47201872eb87ed27c')


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
