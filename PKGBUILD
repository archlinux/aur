# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20251216
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.47.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.0/imgpkg-linux-amd64 kapp-v0.65.0::https://github.com/carvel-dev/kapp/releases/download/v0.65.0/kapp-linux-amd64 kbld-v0.47.0::https://github.com/carvel-dev/kbld/releases/download/v0.47.0/kbld-linux-amd64 kctrl-v0.59.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.45.0::https://github.com/carvel-dev/vendir/releases/download/v0.45.0/vendir-linux-amd64 ytt-v0.52.2::https://github.com/carvel-dev/ytt/releases/download/v0.52.2/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.47.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.0/imgpkg-linux-arm64 kapp-v0.65.0::https://github.com/carvel-dev/kapp/releases/download/v0.65.0/kapp-linux-arm64 kbld-v0.47.0::https://github.com/carvel-dev/kbld/releases/download/v0.47.0/kbld-linux-arm64 kctrl-v0.59.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.59.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.45.0::https://github.com/carvel-dev/vendir/releases/download/v0.45.0/vendir-linux-arm64 ytt-v0.52.2::https://github.com/carvel-dev/ytt/releases/download/v0.52.2/ytt-linux-arm64)
sha256sums_x86_64=(7602b6af24a818265dcb2cc0dc7f6117a3591f26e2c266f294800f99ae433da1 9cb88745d189bbfe2423771d68f50f7222ca33187350470857cca124d3341233 f9cf1d84ed8dd7c19133044e15939e62c9929ecf1115edeb7275f45b99e2d1ac 3cf09ba4ea90e3b44de569ddacaeaa9b1cf930772dee67dbb2a4deefa3c187a8 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 d60ad65bbd0658d377f2dcf57b3119f16c5a3a7eeaf80019a3d243a620404d7e 76d5355a5135c59a1791f420f3094579f775cbf2a987328f920a05e1338f1e1f)
sha256sums_aarch64=(14d0083027eeba54a4804c561fb41d0c723f908ec91e073e88f3a64c52b54544 c7be5fdbbc22d9efc7cb952c13c1e671a632af8530e7958eda89ff010cac78d3 22d0ba350d8ae760dda1162893559c53065bdfb11648855ffcb7b53183a4e717 efd2d439701ccbb63738d584f14509a234f8df94ab34c4700de2e27ce78a7bbd 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f f2b517cfa1a843ffc7b9beb37146ffd8157a5c842138c4f6a5728f708115dbfd 3abce3c1233e328e1cc11161b85d5c162fae04425ac1bbf4d29e6ba54781ff91)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.47.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.65.0" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.47.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.59.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.45.0" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.52.2" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
