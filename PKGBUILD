# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=ytt-bin
pkgver=0.46.2
pkgrel=1
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(ytt)
source_x86_64=(ytt-v0.46.2::https://github.com/carvel-dev/ytt/releases/download/v0.46.2/ytt-linux-amd64)
source_aarch64=(ytt-v0.46.2::https://github.com/carvel-dev/ytt/releases/download/v0.46.2/ytt-linux-arm64)
sha256sums_x86_64=(ae9bc66a55756eed60db86f8c0f8c55704b3ab846513ad4502111c2a8673ecac)
sha256sums_aarch64=(e43a524db8a0c69a54bc56132ac0cf8d55a049c48f63a9047dd6984dc89a940e)
package () 
{ 
    install -Dm 755 "${srcdir}/${_z_binname}-v${pkgver}" "${pkgdir}/usr/bin/${_z_binname}";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$_z_binname completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_z_binname";
    ./$_z_binname completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_z_binname.fish";
    ./$_z_binname completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_z_binname"
}


# Custom variables

_z_binname="ytt"
