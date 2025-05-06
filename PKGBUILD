# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20250506
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.46.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.46.1/imgpkg-linux-amd64 kapp-v0.64.1::https://github.com/carvel-dev/kapp/releases/download/v0.64.1/kapp-linux-amd64 kbld-v0.45.2::https://github.com/carvel-dev/kbld/releases/download/v0.45.2/kbld-linux-amd64 kctrl-v0.56.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.56.1/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.43.2::https://github.com/carvel-dev/vendir/releases/download/v0.43.2/vendir-linux-amd64 ytt-v0.52.0::https://github.com/carvel-dev/ytt/releases/download/v0.52.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.46.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.46.1/imgpkg-linux-arm64 kapp-v0.64.1::https://github.com/carvel-dev/kapp/releases/download/v0.64.1/kapp-linux-arm64 kbld-v0.45.2::https://github.com/carvel-dev/kbld/releases/download/v0.45.2/kbld-linux-arm64 kctrl-v0.56.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.56.1/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.43.2::https://github.com/carvel-dev/vendir/releases/download/v0.43.2/vendir-linux-arm64 ytt-v0.52.0::https://github.com/carvel-dev/ytt/releases/download/v0.52.0/ytt-linux-arm64)
sha256sums_x86_64=(1bc6b735dbdd940a5c78661781f937090bd5fbc89172f01e600ee91fe122edbe 8b7cf929c1498a4ae91b880e77c8ba8b545afc14ee564cd50d749c9f611223ed 5beb63063cc5d4c7de507370e780cf342926cc6e0e343869b01d794fce7f3f99 0adb8e1060fbd3b9cc7c4f926863732ac0be2ae1e746e7232f0e5cd61da00b34 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 172e51a712dd38adecc1c2edaea505ed63079bb6a42f8d613a8da22476f61cf1 4c222403a9a2d54d8bb0e0ca46f699ee4040a2bddd5ab3b6354efd2c85d3209f)
sha256sums_aarch64=(3e7cfba3cc55401ad1bbc80c7710e67a0376c56d8a72dc81864ffbbe64b30aba a74f11266571fab611d6d371f8ebc275fd16d7545ec00a8d178f2ac33e72d17c c37f9b6c2f67066a33d1232580dddb5d36cdd8b244c1bc156bc668df1e8d2099 43a11bed3e52028b268aa101cc546c915adc5bc3ab586bdad01a6f4fde554bd1 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 29cb3224debc23f1aaab46bb8f26bf0d094bdb8a557fdb6e4e04465077762e25 781f8950da84b2d2928b139eb38567584d9ddebc7e5a34fd97209ad61ae9cc65)
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
    install -Dm 755 "${srcdir}/kapp-v0.64.1" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.45.2" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.56.1" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.43.2" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.52.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
