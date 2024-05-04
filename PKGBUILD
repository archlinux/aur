# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20240504
pkgrel=1
pkgdesc='Deprecated: install carvel tools separately'
url='https://carvel.dev'
arch=(x86_64 aarch64)
license=(Apache)
install='1.install'
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.42.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.42.1/imgpkg-linux-amd64 kapp-v0.62.0::https://github.com/carvel-dev/kapp/releases/download/v0.62.0/kapp-linux-amd64 kbld-v0.43.0::https://github.com/carvel-dev/kbld/releases/download/v0.43.0/kbld-linux-amd64 kctrl-v0.51.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.51.0/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.40.1::https://github.com/carvel-dev/vendir/releases/download/v0.40.1/vendir-linux-amd64 ytt-v0.49.0::https://github.com/carvel-dev/ytt/releases/download/v0.49.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.42.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.42.1/imgpkg-linux-arm64 kapp-v0.62.0::https://github.com/carvel-dev/kapp/releases/download/v0.62.0/kapp-linux-arm64 kbld-v0.43.0::https://github.com/carvel-dev/kbld/releases/download/v0.43.0/kbld-linux-arm64 kctrl-v0.51.0::https://github.com/carvel-dev/kapp-controller/releases/download/v0.51.0/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.40.1::https://github.com/carvel-dev/vendir/releases/download/v0.40.1/vendir-linux-arm64 ytt-v0.49.0::https://github.com/carvel-dev/ytt/releases/download/v0.49.0/ytt-linux-arm64)
sha256sums_x86_64=(fc4e0bc2e238b2ffaff8f04fba0844de0d1e5ef7dd870a4d01896361b5b5510b 6eb24733364213967c434ca77a7b3516f80c962e1da1ba57ce4c495556cf1585 119e7d11e66e512896ce42aba9cc7f783388da3cbb258b793e7419a3167af2a9 2de0eeada145888f8ac911c1f8a4e1d1b6b4202afd63cbca7f81bdc50d110b72 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 d7c602d8882085be78cd02a575a6c3b437bb2fa1ff1067712f593d8cf05c94fa 357ec754446b1eda29dd529e088f617e85809726c686598ab03cfc1c79f43b56)
sha256sums_aarch64=(78ed95d612a927abc344df8cadd052610637566b98594252db3bc03ff2713d83 10e2e0b165202ae355501516f0b34de066523a384970f8423d8295ca79c16133 562002e56ba13f6b148b2674b3ddd94b64dd53b73190fc1e84904232f5151627 bdb68052e1791552bcb23231d0fefa45e98daf278555393a955bcbf1ebcd91ee 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 43e98922103ef30995a11bd4491b138b635c9b7bf17f98475fb5a06c87392e1d a2d195b058884c0e36a918936076965b8efb426f7e00f6b7d7b99b82737c7299)
package () 
{ 
    set -eo pipefail;
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    install -Dm 755 "${srcdir}/imgpkg-v0.42.1" "${pkgdir}/usr/bin/imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-imgpkg";
    "${pkgdir}/usr/bin/imgpkg" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-imgpkg.fish";
    "${pkgdir}/usr/bin/imgpkg" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.62.0" "${pkgdir}/usr/bin/kapp";
    "${pkgdir}/usr/bin/kapp" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kapp";
    "${pkgdir}/usr/bin/kapp" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kapp.fish";
    "${pkgdir}/usr/bin/kapp" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kapp";
    install -Dm 755 "${srcdir}/kbld-v0.43.0" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.51.0" "${pkgdir}/usr/bin/kctrl";
    "${pkgdir}/usr/bin/kctrl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-kctrl";
    "${pkgdir}/usr/bin/kctrl" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-kctrl.fish";
    "${pkgdir}/usr/bin/kctrl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.40.1" "${pkgdir}/usr/bin/vendir";
    "${pkgdir}/usr/bin/vendir" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-vendir";
    "${pkgdir}/usr/bin/vendir" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-vendir.fish";
    "${pkgdir}/usr/bin/vendir" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-vendir";
    install -Dm 755 "${srcdir}/ytt-v0.49.0" "${pkgdir}/usr/bin/ytt";
    "${pkgdir}/usr/bin/ytt" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}-ytt";
    "${pkgdir}/usr/bin/ytt" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}-ytt.fish";
    "${pkgdir}/usr/bin/ytt" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}-ytt"
}


# Custom variables

_z_assets=([0]="1.install")
