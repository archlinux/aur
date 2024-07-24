# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240724
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.43.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.43.0/imgpkg-linux-amd64 kapp-v0.63.2::https://github.com/carvel-dev/kapp/releases/download/v0.63.2/kapp-linux-amd64 kbld-v0.44.0::https://github.com/carvel-dev/kbld/releases/download/v0.44.0/kbld-linux-amd64 kctrl-v0.53.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.53.0/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.41.0::https://github.com/carvel-dev/vendir/releases/download/v0.41.0/vendir-linux-amd64 ytt-v0.50.0::https://github.com/carvel-dev/ytt/releases/download/v0.50.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.43.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.43.0/imgpkg-linux-arm64 kapp-v0.63.2::https://github.com/carvel-dev/kapp/releases/download/v0.63.2/kapp-linux-arm64 kbld-v0.44.0::https://github.com/carvel-dev/kbld/releases/download/v0.44.0/kbld-linux-arm64 kctrl-v0.53.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.53.0/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.41.0::https://github.com/carvel-dev/vendir/releases/download/v0.41.0/vendir-linux-arm64 ytt-v0.50.0::https://github.com/carvel-dev/ytt/releases/download/v0.50.0/ytt-linux-arm64)
sha256sums_x86_64=(4f87f219012e48b917d7aaf8b0ee71729f2572fc1a3deb7483bd8744fe2e1a06 d760b51d8e9e3f5d0847e84fad05a51d1415fcfe309e10f885edd51d3e8c1301 2b1550a7293963fec0a4d2b6fdbfa9fc24af4a43035d18ba8e6f9b4c67662ad0 9c33cfaae971718221c44feeca85faa703e7399f2e9d3fc98c9b1160ee765fb3 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 3b1094bf45a9ff5c2915a986f4d7cee8480c3cab31c060445f851c48f397ee31 61dec6e00131f990db853afc4b7531c318bd3af3ba18f2cfdbc0d5e83a45c445)
sha256sums_aarch64=(099627a79b7edf9ba99321f4dc4e43404bc83c42930864c9db650070e65cfb5a f499fa48f42509e8e4e492c5f68126205319529e34b98249adbfb082a31b37db 3a85316703a6c22d2d4d286a09993cd8d9c4955ca9e863f8fd7096a596070840 0e8fde1c937c1ad49dd42de8f4a9a41ccbeb3514ced8c83ad15dc04e3f2a9a96 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f f1456d6cbf11299eece2e87563caabe24309302c327c5e42a357ebeaba057a05 f38290c2666ddcf6feb4907f91033c4f41022b3fb84893c42d1f48948597b82a)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.43.0" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.63.2" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.44.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.53.0" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.41.0" "${pkgdir}/usr/bin/vendir";
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
