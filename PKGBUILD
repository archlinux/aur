# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20260515
pkgrel=2
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.48.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.0/imgpkg-linux-amd64 kapp-v0.65.3::https://github.com/carvel-dev/kapp/releases/download/v0.65.3/kapp-linux-amd64 kbld-v0.48.0::https://github.com/carvel-dev/kbld/releases/download/v0.48.0/kbld-linux-amd64 kctrl-v0.59.8::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.8/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.45.3::https://github.com/carvel-dev/vendir/releases/download/v0.45.3/vendir-linux-amd64 ytt-v0.55.0::https://github.com/carvel-dev/ytt/releases/download/v0.55.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.48.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.0/imgpkg-linux-arm64 kapp-v0.65.3::https://github.com/carvel-dev/kapp/releases/download/v0.65.3/kapp-linux-arm64 kbld-v0.48.0::https://github.com/carvel-dev/kbld/releases/download/v0.48.0/kbld-linux-arm64 kctrl-v0.59.8::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.8/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.45.3::https://github.com/carvel-dev/vendir/releases/download/v0.45.3/vendir-linux-arm64 ytt-v0.55.0::https://github.com/carvel-dev/ytt/releases/download/v0.55.0/ytt-linux-arm64)
sha256sums_x86_64=(c35814ecab145c28700e9cc86826ed08942f17162cb1fb796e075058b022488c 1724da4b62982285b1da696fb0354738e33913b33e59f3787b5c2b5ac7030327 52521ed5eebdddc2e7c7dc04da775270677a450f958198d0c26b3cb011f58a29 76a5f88d562b8ed751d7865f3e328e0b60e8e4682e5c59bae6223706881752ab 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 7dc6dd9706170b442a7aaf3b4e29da57cca722a3252ed8f6ac9c2997e93a0aa5 013adf9ed2fbd392b9861e5ec34015dabfcfa2e82da9e8cc0ee1e5c6a7f9b64b)
sha256sums_aarch64=(63719b10884f95b83b7dc0831257869dadfe02ea7c68b7c9fdcb35ba687d5cf5 485eb76508c33365780a91831ebbf030b1be93b02d6011935abdaa751328d719 8f94aecad48df7ee99fa347eb24efad71ae0fb6ae3be03677a3c7d1ead359f1d 57059c6486d57d8df425fc79cf4b04d8a6c58d8936de83eedf94a809127d7d45 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f cb951dedcf2e64d8d76cb9c205d13ce78f6a8802a74caa1205ec47bc9f2dac65 14e0a83a793c04bd26b2a2328f6df169b38ddf24257a64ffde23038f4ecab0bf)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.48.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.65.3" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.48.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.59.8" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.45.3" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.55.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
