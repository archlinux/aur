# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20231206
pkgrel=1
pkgdesc='Set of Carvel tools (binaries): imgpkg kapp kbld kctrl kwt vendir ytt'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.39.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.39.0/imgpkg-linux-amd64 kapp-v0.59.1::https://github.com/carvel-dev/kapp/releases/download/v0.59.1/kapp-linux-amd64 kbld-v0.38.1::https://github.com/carvel-dev/kbld/releases/download/v0.38.1/kbld-linux-amd64 kctrl-v0.49.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.49.0/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.38.0::https://github.com/carvel-dev/vendir/releases/download/v0.38.0/vendir-linux-amd64 ytt-v0.46.2::https://github.com/carvel-dev/ytt/releases/download/v0.46.2/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.39.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.39.0/imgpkg-linux-arm64 kapp-v0.59.1::https://github.com/carvel-dev/kapp/releases/download/v0.59.1/kapp-linux-arm64 kbld-v0.38.1::https://github.com/carvel-dev/kbld/releases/download/v0.38.1/kbld-linux-arm64 kctrl-v0.49.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.49.0/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.38.0::https://github.com/carvel-dev/vendir/releases/download/v0.38.0/vendir-linux-arm64 ytt-v0.46.2::https://github.com/carvel-dev/ytt/releases/download/v0.46.2/ytt-linux-arm64)
sha256sums_x86_64=(98b80baa5d665c5119fc8e2a62978f9d193c9647e3c47ab72867b055b94d14ff a6da34c733514c2c51b96a12e70cd050250a45b2ee75d6966a904e712b307d15 00e114286588307d0785c4bfb1bb8f68acca1ea186eb79cd8475214214413291 ed47847850039cf5572af49420d0365b2cc68a3a731fbc5e8a23b13eb8ffb020 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 49076dd93ae931ac0d341d81e51b6fdb2288c718cfda8279b78e31c6d389da5f ae9bc66a55756eed60db86f8c0f8c55704b3ab846513ad4502111c2a8673ecac)
sha256sums_aarch64=(7b247c24850dbf4ff70095b6d7f5aff12aea15d0ece9e9ecf66f92e3c9d2f332 a0e4eccdc264b535d7b0ba1972b6fd29cd5aa1263ab7e996d5a4671253fd3cf9 dba78f59d887cc7433595a1e7754fcbc3a7a53f5fbbb23b2798d95114795ce78 f513b6b58a75b45506c3a347f63118bd4abffab9c69975c32089c7756d5807a4 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 88e3588632f58f44f31d3fa19f60d4aad8ea0075b6fc68956a9d061d8de2442d e43a524db8a0c69a54bc56132ac0cf8d55a049c48f63a9047dd6984dc89a940e)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.39.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.59.1" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.38.1" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.49.0" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.38.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.46.2" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}
