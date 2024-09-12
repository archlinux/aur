# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240911
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.43.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.43.1/imgpkg-linux-amd64 kapp-v0.63.3::https://github.com/carvel-dev/kapp/releases/download/v0.63.3/kapp-linux-amd64 kbld-v0.44.1::https://github.com/carvel-dev/kbld/releases/download/v0.44.1/kbld-linux-amd64 kctrl-v0.53.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.53.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.42.0::https://github.com/carvel-dev/vendir/releases/download/v0.42.0/vendir-linux-amd64 ytt-v0.50.0::https://github.com/carvel-dev/ytt/releases/download/v0.50.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.43.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.43.1/imgpkg-linux-arm64 kapp-v0.63.3::https://github.com/carvel-dev/kapp/releases/download/v0.63.3/kapp-linux-arm64 kbld-v0.44.1::https://github.com/carvel-dev/kbld/releases/download/v0.44.1/kbld-linux-arm64 kctrl-v0.53.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.53.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.42.0::https://github.com/carvel-dev/vendir/releases/download/v0.42.0/vendir-linux-arm64 ytt-v0.50.0::https://github.com/carvel-dev/ytt/releases/download/v0.50.0/ytt-linux-arm64)
sha256sums_x86_64=(d36ccfcc54143d2475cf09b0247c88bccf24a7aeb062bd9bb8cab7cb58135fcf 33702a40b6032ada742d73c59afeb393d0830a1913e3a599ca995eba3e68a57e ffd557f0057c22b8f49ff77ee1ea40d93f3da2b9cb18a82e9dda9399970c2282 008e8543a1389ab29a75470a6f602b569e28fa866f72ddb214df32d57e09ed1c 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 40afd08db3b1ee96350f1ab09bd9208aa7edec458c4b5f167eb71ac076576571 61dec6e00131f990db853afc4b7531c318bd3af3ba18f2cfdbc0d5e83a45c445)
sha256sums_aarch64=(7cd1ecf4b394770ccfedc38f3b4f97a1a3d49447fa0bfe1e28a4f99751597ddf dbdfa194067c420b5e5ed36cb99f008c9a2dec05f5aeebe770b854898d3de2c4 afcb44d37dbac1e2f23c056865798efe0f8b7ff982eee4644ceb146e30584e4a 3536d4fce287e8979d1c93d44309cf86db88e720b416e38f9346ddc5dfd95b28 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f fd631a32207efd79d84911186c50d80cbd136a4cddb5dffa3f11c3f7689c6ff0 f38290c2666ddcf6feb4907f91033c4f41022b3fb84893c42d1f48948597b82a)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.43.1" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.63.3" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.44.1" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.53.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.42.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.50.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
