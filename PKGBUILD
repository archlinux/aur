# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240705
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.42.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.42.2/imgpkg-linux-amd64 kapp-v0.63.1::https://github.com/carvel-dev/kapp/releases/download/v0.63.1/kapp-linux-amd64 kbld-v0.43.2::https://github.com/carvel-dev/kbld/releases/download/v0.43.2/kbld-linux-amd64 kctrl-v0.52.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.52.0/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.40.2::https://github.com/carvel-dev/vendir/releases/download/v0.40.2/vendir-linux-amd64 ytt-v0.49.1::https://github.com/carvel-dev/ytt/releases/download/v0.49.1/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.42.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.42.2/imgpkg-linux-arm64 kapp-v0.63.1::https://github.com/carvel-dev/kapp/releases/download/v0.63.1/kapp-linux-arm64 kbld-v0.43.2::https://github.com/carvel-dev/kbld/releases/download/v0.43.2/kbld-linux-arm64 kctrl-v0.52.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.52.0/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.40.2::https://github.com/carvel-dev/vendir/releases/download/v0.40.2/vendir-linux-arm64 ytt-v0.49.1::https://github.com/carvel-dev/ytt/releases/download/v0.49.1/ytt-linux-arm64)
sha256sums_x86_64=(bea6e08f5f6bf8b2a7f31486c41b34715e5dd6e4319e15968e25cd570daf5446 3eed107de438378b35e619b37791512984e870e7e647fea312226a0e6fc9cd43 db3853dc1ab9721462cb89899d430be1228fa63365a01739e3e9b741e67a818a 355e239fd2c8fe952620c301792098b4bcaebdd965d760a1a8283dd0824a3782 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 59eba74240e96d96fae62c2cd2fdd2606dde9217fb1cd4c04a5a074a9afcb59e 20a2f7466157a9c6189e885d0027e17c48776e65627f30fe04bffeef1d6f6166)
sha256sums_aarch64=(493f0931964e800aab255fe32256d044369c997537e7fdc8fcc93ac978c5462e fecd32c9760da68791e591afffd53ce0a935471bf40d1e3fd941e602d7becb04 a5ba69f39fd8a6db6f679de4aa1889f556c67fd725dc998cfa28a510cfa2d376 1959ba7885afb826c3f8760e69cb28a8b8917cb84075c85791c841d8f8f52c94 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f c4068b8d46fe740f356685d3294043d3b1358d925e3d85e6b5294d5c7e43099a 7a8d04ac91578239d32683eea7c5bb045e6e3f0df6a8c3bb42927a161b7da4db)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.42.2" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.63.1" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.43.2" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.52.0" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.40.2" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.49.1" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
