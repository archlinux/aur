# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240321
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.41.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.41.1/imgpkg-linux-amd64 kapp-v0.60.0::https://github.com/carvel-dev/kapp/releases/download/v0.60.0/kapp-linux-amd64 kbld-v0.42.0::https://github.com/carvel-dev/kbld/releases/download/v0.42.0/kbld-linux-amd64 kctrl-v0.50.2::https://github.com/carvel-dev/kapp-controller/releases/download/v0.50.2/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.40.0::https://github.com/carvel-dev/vendir/releases/download/v0.40.0/vendir-linux-amd64 ytt-v0.48.0::https://github.com/carvel-dev/ytt/releases/download/v0.48.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.41.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.41.1/imgpkg-linux-arm64 kapp-v0.60.0::https://github.com/carvel-dev/kapp/releases/download/v0.60.0/kapp-linux-arm64 kbld-v0.42.0::https://github.com/carvel-dev/kbld/releases/download/v0.42.0/kbld-linux-arm64 kctrl-v0.50.2::https://github.com/carvel-dev/kapp-controller/releases/download/v0.50.2/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.40.0::https://github.com/carvel-dev/vendir/releases/download/v0.40.0/vendir-linux-arm64 ytt-v0.48.0::https://github.com/carvel-dev/ytt/releases/download/v0.48.0/ytt-linux-arm64)
sha256sums_x86_64=(e6291309be274d8137116bba06824af763e22110d48e9cc45aca0d3135420966 7cc17971634da69c80d7159199c2c514c38b479d28987e055ce2c173bfbd9306 c5eb701a9682e73a8caa636a735bd2a587343bcbdf6c2eaabb5d99b9c57cab7e d399b865ad2081cc4761d57de00d0d93ef297d7198e7e329c3f195e47af79573 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 3e076a452d88d6e3bc190d527f4d7c949ab6eccae19bf5d3cbb910d53724f2b9 090dc914c87e5ba5861e37f885f12bac3b15559c183c30d4af2e63ccab03d5f9)
sha256sums_aarch64=(1fc1c933cc235ef13dedf701075b36fea9c5da425783bec18452ccfb5332cac9 9847fa6f7122451e14833d9aaa376692dfc9fe2895ceb3a7159616a8041b68f5 6d8bb0e87fd88d0df2357519ba680c61cf9560b30c199d0a2d60873644ec42f1 1ee3a40b740fc78d88502b23d36036c66bae479829065a3ccbacd081a6074137 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f c43469a085dd0f6cebdab97a7747710f9dafa4886dd5e0ae7c1d3f975a12756e 156ba28cd605e126a2f7746a285a8298dd68f08d5e201a0b5a33ae6cc21b9c96)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.41.1" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.60.0" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.42.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.50.2" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.40.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.48.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
