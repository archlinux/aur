# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240207
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.40.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.40.0/imgpkg-linux-amd64 kapp-v0.60.0::https://github.com/carvel-dev/kapp/releases/download/v0.60.0/kapp-linux-amd64 kbld-v0.39.0::https://github.com/carvel-dev/kbld/releases/download/v0.39.0/kbld-linux-amd64 kctrl-v0.50.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.50.0/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.39.0::https://github.com/carvel-dev/vendir/releases/download/v0.39.0/vendir-linux-amd64 ytt-v0.48.0::https://github.com/carvel-dev/ytt/releases/download/v0.48.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.40.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.40.0/imgpkg-linux-arm64 kapp-v0.60.0::https://github.com/carvel-dev/kapp/releases/download/v0.60.0/kapp-linux-arm64 kbld-v0.39.0::https://github.com/carvel-dev/kbld/releases/download/v0.39.0/kbld-linux-arm64 kctrl-v0.50.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.50.0/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.39.0::https://github.com/carvel-dev/vendir/releases/download/v0.39.0/vendir-linux-arm64 ytt-v0.48.0::https://github.com/carvel-dev/ytt/releases/download/v0.48.0/ytt-linux-arm64)
sha256sums_x86_64=(de2ea4c292833736f9627c26ab43191f923aa96ae0c66dc95c546be42e0f90c5 7cc17971634da69c80d7159199c2c514c38b479d28987e055ce2c173bfbd9306 cdbfdfc1e5da490eb59705bfbc30b3fd05c0485474aff15bec52352af46d5880 617a4e3ad2e247feb09857086d796065dad4df73cb81dc59d1aa7bfa4a9aff07 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 feb2836153508adfb6fd33c127e466c9ce26577678e93a252be2fec445f4501f 090dc914c87e5ba5861e37f885f12bac3b15559c183c30d4af2e63ccab03d5f9)
sha256sums_aarch64=(670b98c5c5b24ae20101b3ab2c430bf2340a9d47b21257b08c8ead20b207e615 9847fa6f7122451e14833d9aaa376692dfc9fe2895ceb3a7159616a8041b68f5 9da907c879102d7dc4205e073d6d32abf4ef1c719851e96498aae42ed691c342 957a17fff540e40c60387682beb96de3b4444ebf222b5d771f8a1881d4bea65a 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 012531a2f1a2de8bc89f1623edfc40a7ac5aee421fe609085278fb9e287f1cdf 156ba28cd605e126a2f7746a285a8298dd68f08d5e201a0b5a33ae6cc21b9c96)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.40.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.60.0" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.39.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.50.0" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.39.0" "${pkgdir}/usr/bin/vendir";
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
