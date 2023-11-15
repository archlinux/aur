# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=ytt-bin
pkgver=0.46.0
pkgrel=2
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(ytt)
source_x86_64=(ytt-v0.46.0::https://github.com/carvel-dev/ytt/releases/download/v0.46.0/ytt-linux-amd64)
source_aarch64=(ytt-v0.46.0::https://github.com/carvel-dev/ytt/releases/download/v0.46.0/ytt-linux-arm64)
sha256sums_x86_64=(348cb34965b64c07fd5118e69efd9a4fae7e22f57db4e91e2d9903c1ad19f041)
sha256sums_aarch64=(9552c863452622386b9e9fcab0eb0533b6e8c77bc3f5c753967d40232b2a1721)
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
