# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20261116
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.49.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.49.2/imgpkg-linux-amd64 kapp-v0.66.2::https://github.com/carvel-dev/kapp/releases/download/v0.66.2/kapp-linux-amd64 kbld-v0.50.0::https://github.com/carvel-dev/kbld/releases/download/v0.50.0/kbld-linux-amd64 kctrl-v0.60.10::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.10/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.47.0::https://github.com/carvel-dev/vendir/releases/download/v0.47.0/vendir-linux-amd64 ytt-v0.56.0::https://github.com/carvel-dev/ytt/releases/download/v0.56.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.49.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.49.2/imgpkg-linux-arm64 kapp-v0.66.2::https://github.com/carvel-dev/kapp/releases/download/v0.66.2/kapp-linux-arm64 kbld-v0.50.0::https://github.com/carvel-dev/kbld/releases/download/v0.50.0/kbld-linux-arm64 kctrl-v0.60.10::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.10/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.47.0::https://github.com/carvel-dev/vendir/releases/download/v0.47.0/vendir-linux-arm64 ytt-v0.56.0::https://github.com/carvel-dev/ytt/releases/download/v0.56.0/ytt-linux-arm64)
sha256sums_x86_64=(1fbc3429cffadd8f8ee0fda85434890778100f69544cfa40152ccde35ed16a0e 48122dc249e48f8c92e2b3613fb4672950aaef2570248655fbede4c4d57b08a3 5f3eae9bb1e15f745d9e5a1a3b422bcc3aff265f0b178392c2de617a5bbc02ea f397167dbc4be71267e1f70aaf362ce69739c69aa237c010abb132b3630628a5 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 9d1099f48f04882a716934178bb9ba8f2373c96b0bea536540106757bc4081e3 b6dd3ed8774c98e17f0e6d5d50486ab796b455d4068cc2dde761e78694303300)
sha256sums_aarch64=(ee9131599582d420ed16d42689b9911623c3629cf1234556ccfc8e0d0a0d5fcf 3c2fc725afee527a0e38b4da55e41bdddf608d27a1ee830c29ba566132366fcb ac12dad160aefa7e03558172e83825c524c1bb3d1a0b7b852be591ad2ee6fd42 aca7b5dda05d00027afcf1a0192772f52e68efc71c0392904968b0d4f398a39d 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 60b5331f0f68e374df3e283744ca7b28b69015d388c432a4dbd14d3202ec6fce 291f93782a09e18157ba43e17476c2644477fae0e81277452a25ff545f47fbb1)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.49.2" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.66.2" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.50.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.60.10" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.47.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.56.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
