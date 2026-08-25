# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20260825
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.48.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.1/imgpkg-linux-amd64 kapp-v0.65.4::https://github.com/carvel-dev/kapp/releases/download/v0.65.4/kapp-linux-amd64 kbld-v0.49.1::https://github.com/carvel-dev/kbld/releases/download/v0.49.1/kbld-linux-amd64 kctrl-v0.60.4::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.4/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.46.1::https://github.com/carvel-dev/vendir/releases/download/v0.46.1/vendir-linux-amd64 ytt-v0.55.2::https://github.com/carvel-dev/ytt/releases/download/v0.55.2/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.48.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.1/imgpkg-linux-arm64 kapp-v0.65.4::https://github.com/carvel-dev/kapp/releases/download/v0.65.4/kapp-linux-arm64 kbld-v0.49.1::https://github.com/carvel-dev/kbld/releases/download/v0.49.1/kbld-linux-arm64 kctrl-v0.60.4::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.4/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.46.1::https://github.com/carvel-dev/vendir/releases/download/v0.46.1/vendir-linux-arm64 ytt-v0.55.2::https://github.com/carvel-dev/ytt/releases/download/v0.55.2/ytt-linux-arm64)
sha256sums_x86_64=(6c7a1a2e6555e7827c3c97580be87c84d06778d0650d308f7dc67613aec7c7c8 bf7df0647d7645572d45185bb8bf6a40dd1e631ff4ee1522bc8ce56db53bd243 437d38d3e59d01dd0d1ad75b4eb67fbd04fe51ed3de1ed55c3f7b3b7d5ec7546 7b88d7bbdd0059175e7608284b291a935555abc71575b951063a3ce2bdc408ad 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 96318c8f2f6ed8b0853b5fac50e22e400af6d8fb2699835e5a8b1663db65c6a9 512cc21193d3b0ce307b6e8db6ba8d40831f16e02526e1c753416456ea4319af)
sha256sums_aarch64=(ce7243af30411581474ab86051774626b34c5b95ff1d030b3ee979ebddaf795d e41693ac3d69e1143c7e5fe870712ca05ed810e1e0bc5b00f77ca22ba0f18ae1 b3f5277ff4819de189d1ebd6e455b3390308ca43b122b5bb3c40a7bb9e6f30c4 f9f7ef17c8447523aa7f239168fae2933bdf8ca849c48ec4385806047647a26a 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 6f9b8d829fdead89b40feca901c5804826db94121abecdc6808052c3252e847b 6b09566cd9cbe90050c8685889aa1eef050c3f1168809df2486062e8a3ed1ec0)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.48.1" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.65.4" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.49.1" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.60.4" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.46.1" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.55.2" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
