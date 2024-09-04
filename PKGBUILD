# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240903
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.43.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.43.1/imgpkg-linux-amd64 kapp-v0.63.3::https://github.com/carvel-dev/kapp/releases/download/v0.63.3/kapp-linux-amd64 kbld-v0.44.0::https://github.com/carvel-dev/kbld/releases/download/v0.44.0/kbld-linux-amd64 kctrl-v0.53.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.53.0/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.41.1::https://github.com/carvel-dev/vendir/releases/download/v0.41.1/vendir-linux-amd64 ytt-v0.50.0::https://github.com/carvel-dev/ytt/releases/download/v0.50.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.43.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.43.1/imgpkg-linux-arm64 kapp-v0.63.3::https://github.com/carvel-dev/kapp/releases/download/v0.63.3/kapp-linux-arm64 kbld-v0.44.0::https://github.com/carvel-dev/kbld/releases/download/v0.44.0/kbld-linux-arm64 kctrl-v0.53.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.53.0/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.41.1::https://github.com/carvel-dev/vendir/releases/download/v0.41.1/vendir-linux-arm64 ytt-v0.50.0::https://github.com/carvel-dev/ytt/releases/download/v0.50.0/ytt-linux-arm64)
sha256sums_x86_64=(d36ccfcc54143d2475cf09b0247c88bccf24a7aeb062bd9bb8cab7cb58135fcf 33702a40b6032ada742d73c59afeb393d0830a1913e3a599ca995eba3e68a57e 2b1550a7293963fec0a4d2b6fdbfa9fc24af4a43035d18ba8e6f9b4c67662ad0 9c33cfaae971718221c44feeca85faa703e7399f2e9d3fc98c9b1160ee765fb3 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 f878f3e16b702c47e42b2215a670d65028bc0158643ed28a2dfaa6f37b1344ac 61dec6e00131f990db853afc4b7531c318bd3af3ba18f2cfdbc0d5e83a45c445)
sha256sums_aarch64=(7cd1ecf4b394770ccfedc38f3b4f97a1a3d49447fa0bfe1e28a4f99751597ddf dbdfa194067c420b5e5ed36cb99f008c9a2dec05f5aeebe770b854898d3de2c4 3a85316703a6c22d2d4d286a09993cd8d9c4955ca9e863f8fd7096a596070840 0e8fde1c937c1ad49dd42de8f4a9a41ccbeb3514ced8c83ad15dc04e3f2a9a96 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 58facd06bae6ffc858b348da9dcc0b032d030a6a31767fea6f9166658d7a61e2 f38290c2666ddcf6feb4907f91033c4f41022b3fb84893c42d1f48948597b82a)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.43.1" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.63.3" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.44.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.53.0" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.41.1" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.50.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
