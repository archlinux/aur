# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20250404
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.45.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.45.0/imgpkg-linux-amd64 kapp-v0.64.1::https://github.com/carvel-dev/kapp/releases/download/v0.64.1/kapp-linux-amd64 kbld-v0.45.1::https://github.com/carvel-dev/kbld/releases/download/v0.45.1/kbld-linux-amd64 kctrl-v0.55.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.55.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.43.2::https://github.com/carvel-dev/vendir/releases/download/v0.43.2/vendir-linux-amd64 ytt-v0.51.2::https://github.com/carvel-dev/ytt/releases/download/v0.51.2/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.45.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.45.0/imgpkg-linux-arm64 kapp-v0.64.1::https://github.com/carvel-dev/kapp/releases/download/v0.64.1/kapp-linux-arm64 kbld-v0.45.1::https://github.com/carvel-dev/kbld/releases/download/v0.45.1/kbld-linux-arm64 kctrl-v0.55.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.55.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.43.2::https://github.com/carvel-dev/vendir/releases/download/v0.43.2/vendir-linux-arm64 ytt-v0.51.2::https://github.com/carvel-dev/ytt/releases/download/v0.51.2/ytt-linux-arm64)
sha256sums_x86_64=(c06708b47baf4e647ec7d88def7eca21c4d7732b369e832131b1649ab2a4a180 8b7cf929c1498a4ae91b880e77c8ba8b545afc14ee564cd50d749c9f611223ed 9393c678bf03cd6559ef7df4a93507ece934a63779526a97ad632b0a265ec5c8 39dd9593f3a7435ea2a9014dd832b5c9ed1eb1aba52e22c2b6186a0170c52f34 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 172e51a712dd38adecc1c2edaea505ed63079bb6a42f8d613a8da22476f61cf1 61ad01f1df9cc8344c786e93acb1f5707ded9e4b52e4ec55a0f6637f2af53bae)
sha256sums_aarch64=(51dbff787fd64d25869737e92516b4d2e31d4ae2b2f0773dae032217e3e1bf58 a74f11266571fab611d6d371f8ebc275fd16d7545ec00a8d178f2ac33e72d17c 19c59f016a55007093f720af51a890eed65798c293fa798d5ef98be7b170e59d 234bcab23f6d8349855bf1dfd27dd0d1617ff2188034be8c37e984026893d9e1 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 29cb3224debc23f1aaab46bb8f26bf0d094bdb8a557fdb6e4e04465077762e25 ae0bdc3aca64e71276f59679ea9253be5f88fc6880937ae1de3dd42a00492a8c)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.45.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.64.1" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.45.1" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.55.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.43.2" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.51.2" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
