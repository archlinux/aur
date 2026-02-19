# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20260218
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.47.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.2/imgpkg-linux-amd64 kapp-v0.65.1::https://github.com/carvel-dev/kapp/releases/download/v0.65.1/kapp-linux-amd64 kbld-v0.47.1::https://github.com/carvel-dev/kbld/releases/download/v0.47.1/kbld-linux-amd64 kctrl-v0.59.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.45.2::https://github.com/carvel-dev/vendir/releases/download/v0.45.2/vendir-linux-amd64 ytt-v0.53.1::https://github.com/carvel-dev/ytt/releases/download/v0.53.1/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.47.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.2/imgpkg-linux-arm64 kapp-v0.65.1::https://github.com/carvel-dev/kapp/releases/download/v0.65.1/kapp-linux-arm64 kbld-v0.47.1::https://github.com/carvel-dev/kbld/releases/download/v0.47.1/kbld-linux-arm64 kctrl-v0.59.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.45.2::https://github.com/carvel-dev/vendir/releases/download/v0.45.2/vendir-linux-arm64 ytt-v0.53.1::https://github.com/carvel-dev/ytt/releases/download/v0.53.1/ytt-linux-arm64)
sha256sums_x86_64=(c8f0da1ee06a806a0480f874366d4dac1b35fffd64da6ff55e26ea01144e2f9c 057d7fe33dd6afeb452a888d37995f789b9de0778ce4908896e37d37c52e6ead 0950151615895b6a699085ba216a321aec35e4808672277281b94fc58cc0686b 3cf09ba4ea90e3b44de569ddacaeaa9b1cf930772dee67dbb2a4deefa3c187a8 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 ecd053b031fdebfe0486b263a7071320b033f60b6d9e6c6b74ad681f2d7068b5 ecdc1439e52139335e42a23d1aa8941f575c52e70e58da709d2bad5038ecadae)
sha256sums_aarch64=(bcc4766eb2e457d8b1d28e74c2b0a2c2f7e958f43c65ab492dc72fcd5b1d4147 1d92b138d8cf93ae627a3b9dbb1f31fc3d6d6298304f90fdbc122acf3b84c13a 4b649e508d8f5a0d29b15bacf4b70dd43055c284a122fa089524d216c85e9e62 efd2d439701ccbb63738d584f14509a234f8df94ab34c4700de2e27ce78a7bbd 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 8fc36145ca85712f1d6d6b959d6240a7d1d5f6a6dd3850bad9ae848c65e42c56 5e479410a478385f6209624765e21c9880c07c6528ce6ed5e3dcca1e8b4a5677)
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
    install -Dm 755 "${srcdir}/kapp-v0.65.1" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.47.1" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.59.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.45.2" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.53.1" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
