# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20261019
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.49.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.49.0/imgpkg-linux-amd64 kapp-v0.65.5::https://github.com/carvel-dev/kapp/releases/download/v0.65.5/kapp-linux-amd64 kbld-v0.49.2::https://github.com/carvel-dev/kbld/releases/download/v0.49.2/kbld-linux-amd64 kctrl-v0.60.9::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.9/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.46.3::https://github.com/carvel-dev/vendir/releases/download/v0.46.3/vendir-linux-amd64 ytt-v0.55.3::https://github.com/carvel-dev/ytt/releases/download/v0.55.3/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.49.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.49.0/imgpkg-linux-arm64 kapp-v0.65.5::https://github.com/carvel-dev/kapp/releases/download/v0.65.5/kapp-linux-arm64 kbld-v0.49.2::https://github.com/carvel-dev/kbld/releases/download/v0.49.2/kbld-linux-arm64 kctrl-v0.60.9::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.9/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.46.3::https://github.com/carvel-dev/vendir/releases/download/v0.46.3/vendir-linux-arm64 ytt-v0.55.3::https://github.com/carvel-dev/ytt/releases/download/v0.55.3/ytt-linux-arm64)
sha256sums_x86_64=(ea4d83bc88d5c9c6deda3951a80f621ea16769b94d4815edb1078399fdd9a5c3 96ef4d7da52628888542d741080c04fbdbdf313b8fbae9f63f3a35c53119461a 8715db7932129a279b25060a9b90cc0eb9221d111d9924af996d6ed82de5b391 842ea6448d712b103e60b2e2acd91ddc7bda7ba789793af793d7899a64e2c2b0 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 5af8823ecc67b3ce2359bb0b70e72a5dbd765135722ca0ff42c16bc4d7409847 15751b45a819edbf22b3d3eadb5fa9a5a2599128d921660a874bd39c47bb41e1)
sha256sums_aarch64=(bd6200d76c28681328ad8636071730d76c8b6cfbc700b0c53477793ca1e0a0f4 d9329cd6c8ca47387d065ef241c73da20152888d9184a55a0a4a3dc4b66962ed 89c19adefa4c15799fb4d036dc747c7737091190df28ef277398037fbe8947f0 478fb543a435a5761c303a1929bd8f81cab475d03abec06a6b4902121e1d86e1 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 821a9da837a017270743597a2e9b796d2d256385ad85450d6c5d89f05dd5aac9 fed073d52b780a88ce506e68c44f33cedede2dad3d5f4fbe07a2833e45d996ed)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.49.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.65.5" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.49.2" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.60.9" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.46.3" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.55.3" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
