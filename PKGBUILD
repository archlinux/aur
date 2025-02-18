# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20250218
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.44.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.44.0/imgpkg-linux-amd64 kapp-v0.64.0::https://github.com/carvel-dev/kapp/releases/download/v0.64.0/kapp-linux-amd64 kbld-v0.45.0::https://github.com/carvel-dev/kbld/releases/download/v0.45.0/kbld-linux-amd64 kctrl-v0.55.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.55.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.43.0::https://github.com/carvel-dev/vendir/releases/download/v0.43.0/vendir-linux-amd64 ytt-v0.51.1::https://github.com/carvel-dev/ytt/releases/download/v0.51.1/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.44.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.44.0/imgpkg-linux-arm64 kapp-v0.64.0::https://github.com/carvel-dev/kapp/releases/download/v0.64.0/kapp-linux-arm64 kbld-v0.45.0::https://github.com/carvel-dev/kbld/releases/download/v0.45.0/kbld-linux-arm64 kctrl-v0.55.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.55.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.43.0::https://github.com/carvel-dev/vendir/releases/download/v0.43.0/vendir-linux-arm64 ytt-v0.51.1::https://github.com/carvel-dev/ytt/releases/download/v0.51.1/ytt-linux-arm64)
sha256sums_x86_64=(15ca4f8ec4c7a1c6ecf06740a942149887a73845565f0ffbf6ccbf013b65a58a 14207d33130e833d201f2cd6e3e87435fb8b9534298843ed3c00fe7cda5221df e076af83ef05765e6bf825f2bf5ac31c365cc0d513b7317bd634f3b9c6b5ee5d 39dd9593f3a7435ea2a9014dd832b5c9ed1eb1aba52e22c2b6186a0170c52f34 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 3d31f00efc0a11a8dfcf662d45a120d18f99105d1502bbfe12a6cbd9d0b1f570 026a12ee7108ff2d1150eb1347d544367d92e993ade7b2d2727c4c8d13a47a6b)
sha256sums_aarch64=(f772b6eb10654f45d15d2166d5be81cf18529aece59df906c25dcb364f508ebe fc7617107fa87480e6326c1cdf2c62708f455c9d96f8e9550fb5e848c296cc80 9e52c553322fa21a8af10d47d76c66eb7a2f406fad92bb589458554cb4143121 234bcab23f6d8349855bf1dfd27dd0d1617ff2188034be8c37e984026893d9e1 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 0895efdc3fe36f37035ce96169e8cc335a103adcfe02092fcc29f514be8867e7 55849cab41cf7780b0d26da416395cf77576a434a4bcf883b0e2a29944325e7c)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.44.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.64.0" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.45.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.55.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.43.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.51.1" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
