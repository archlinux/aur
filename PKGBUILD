# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20250909
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.46.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.46.1/imgpkg-linux-amd64 kapp-v0.64.2::https://github.com/carvel-dev/kapp/releases/download/v0.64.2/kapp-linux-amd64 kbld-v0.46.0::https://github.com/carvel-dev/kbld/releases/download/v0.46.0/kbld-linux-amd64 kctrl-v0.58.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.58.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.44.0::https://github.com/carvel-dev/vendir/releases/download/v0.44.0/vendir-linux-amd64 ytt-v0.52.1::https://github.com/carvel-dev/ytt/releases/download/v0.52.1/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.46.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.46.1/imgpkg-linux-arm64 kapp-v0.64.2::https://github.com/carvel-dev/kapp/releases/download/v0.64.2/kapp-linux-arm64 kbld-v0.46.0::https://github.com/carvel-dev/kbld/releases/download/v0.46.0/kbld-linux-arm64 kctrl-v0.58.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.58.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.44.0::https://github.com/carvel-dev/vendir/releases/download/v0.44.0/vendir-linux-arm64 ytt-v0.52.1::https://github.com/carvel-dev/ytt/releases/download/v0.52.1/ytt-linux-arm64)
sha256sums_x86_64=(1bc6b735dbdd940a5c78661781f937090bd5fbc89172f01e600ee91fe122edbe 475ed4fc7ee538efceeb02972524a17cb580d9b3e59ab16c7a18de02427daedc 90e8d123d5e33ab13b849997bdb05626fa7f2384120d87a29eebd56490105ca9 978fc078d53a827716dacde7483294d1265c3d42ace0c2582df62b5c38dd17ae 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 a2befbb9dd4f174aac7a34fe0bd50b1e5dc356dadaed0183a24b817f2fd1d094 490f138ae5b6864071d3c20a5a231e378cee7487cd4aeffc79dbf66718e65408)
sha256sums_aarch64=(3e7cfba3cc55401ad1bbc80c7710e67a0376c56d8a72dc81864ffbbe64b30aba bffda57ed0c83cd2a8cc6faaaf97b3aa71f000658258eeaae6b0a31531a0e03a f0202ff24fda501ead70f4b83f24d0e078bb45b52e8ce7217f0b78a6bfedebc3 a9cb74f12effb45c56d16b56551aaf50e96fac0359b5ace6ec8e40d370762ac8 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f db33e705d818f4fa1fb3c19bd97167219188650b96e307a8e72620329aec9a91 7d86bd3299e43d1455201fc213d698bae7482cd88f3e05de2f935e6eab842db9)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.46.1" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.64.2" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.46.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.58.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.44.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.52.1" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
