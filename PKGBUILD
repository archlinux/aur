# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20260612
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.48.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.1/imgpkg-linux-amd64 kapp-v0.65.3::https://github.com/carvel-dev/kapp/releases/download/v0.65.3/kapp-linux-amd64 kbld-v0.49.0::https://github.com/carvel-dev/kbld/releases/download/v0.49.0/kbld-linux-amd64 kctrl-v0.60.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.46.0::https://github.com/carvel-dev/vendir/releases/download/v0.46.0/vendir-linux-amd64 ytt-v0.55.1::https://github.com/carvel-dev/ytt/releases/download/v0.55.1/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.48.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.1/imgpkg-linux-arm64 kapp-v0.65.3::https://github.com/carvel-dev/kapp/releases/download/v0.65.3/kapp-linux-arm64 kbld-v0.49.0::https://github.com/carvel-dev/kbld/releases/download/v0.49.0/kbld-linux-arm64 kctrl-v0.60.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.46.0::https://github.com/carvel-dev/vendir/releases/download/v0.46.0/vendir-linux-arm64 ytt-v0.55.1::https://github.com/carvel-dev/ytt/releases/download/v0.55.1/ytt-linux-arm64)
sha256sums_x86_64=(6c7a1a2e6555e7827c3c97580be87c84d06778d0650d308f7dc67613aec7c7c8 1724da4b62982285b1da696fb0354738e33913b33e59f3787b5c2b5ac7030327 f9ec8530fb677a37d9e9dd7c95fabaa2c857b2c46f21cdfdcec3a665a1236b6d b8dc24b66d13c1f3d8d46b4da50ad78660a309e7b705c8abf8320e26dc6e0b0f 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 878f3c77cae21b9b63d0ea6c11454c0008d41652d2eb3d1844fdcf69cca6ae9e 3a2c925ed222f8db4956946d40279688edd6ceb3e919f03f919a8fc8b8532eda)
sha256sums_aarch64=(ce7243af30411581474ab86051774626b34c5b95ff1d030b3ee979ebddaf795d 485eb76508c33365780a91831ebbf030b1be93b02d6011935abdaa751328d719 5ac217660fa3418686c55d57fe1b8106d5102f95c87ac10396c927f822dc304c 45d1fd3d5f9f1b8d8ea8ee33a605ca9e068cf8f13b35fe36a47f1b5d4d71bc0a 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f f80a27f1247ad4353b6054ca9d7e13e2511bf70c0e28d85bc314d2177ec2b0d2 ce61f7aee3f66f9b78d5781ef8528b7c8e199a2747796ef17a954118d3e65724)
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
    install -Dm 755 "${srcdir}/kapp-v0.65.3" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.49.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.60.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.46.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.55.1" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
