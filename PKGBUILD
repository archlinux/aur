# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20260430
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.47.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.2/imgpkg-linux-amd64 kapp-v0.65.2::https://github.com/carvel-dev/kapp/releases/download/v0.65.2/kapp-linux-amd64 kbld-v0.47.3::https://github.com/carvel-dev/kbld/releases/download/v0.47.3/kbld-linux-amd64 kctrl-v0.59.8::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.8/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.45.3::https://github.com/carvel-dev/vendir/releases/download/v0.45.3/vendir-linux-amd64 ytt-v0.54.0::https://github.com/carvel-dev/ytt/releases/download/v0.54.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.47.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.2/imgpkg-linux-arm64 kapp-v0.65.2::https://github.com/carvel-dev/kapp/releases/download/v0.65.2/kapp-linux-arm64 kbld-v0.47.3::https://github.com/carvel-dev/kbld/releases/download/v0.47.3/kbld-linux-arm64 kctrl-v0.59.8::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.8/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.45.3::https://github.com/carvel-dev/vendir/releases/download/v0.45.3/vendir-linux-arm64 ytt-v0.54.0::https://github.com/carvel-dev/ytt/releases/download/v0.54.0/ytt-linux-arm64)
sha256sums_x86_64=(c8f0da1ee06a806a0480f874366d4dac1b35fffd64da6ff55e26ea01144e2f9c 38b0a6eb958210f5db2cf79ee4082adf7b6cf52de983b5364c56d03d898b6439 26be68f9ec354a2753f102707f4389e28111d36c2a318b72cd1bcff719fabb6c 76a5f88d562b8ed751d7865f3e328e0b60e8e4682e5c59bae6223706881752ab 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 7dc6dd9706170b442a7aaf3b4e29da57cca722a3252ed8f6ac9c2997e93a0aa5 6a1549260d7641585c4434c83ad237a66ec4fd4478edbd32e5e190ce1e755d20)
sha256sums_aarch64=(bcc4766eb2e457d8b1d28e74c2b0a2c2f7e958f43c65ab492dc72fcd5b1d4147 a877a004f8b703218883c3f7140bda216f53b9b9e5b29fecf5cec7d4ad6d85b0 e985d62a8539ca2386c0e3db0e2c357adf55a4fdd0fa0e4ad7ab48a852c11ab1 57059c6486d57d8df425fc79cf4b04d8a6c58d8936de83eedf94a809127d7d45 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f cb951dedcf2e64d8d76cb9c205d13ce78f6a8802a74caa1205ec47bc9f2dac65 2ee1dee5c952a081896ac5b30853b6e59bd77b5fdd244bff2ea16a3172e8fb5a)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.47.2" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.65.2" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.47.3" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.59.8" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.45.3" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.54.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
