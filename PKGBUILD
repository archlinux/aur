# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kbld-bin
pkgver=0.38.1
pkgrel=2
pkgdesc='kbld seamlessly incorporates image building and image pushing into your development and deployment workflows'
url='https://carvel.dev/kbld'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(kbld)
source_x86_64=(kbld-v0.38.1::https://github.com/carvel-dev/kbld/releases/download/v0.38.1/kbld-linux-amd64)
source_aarch64=(kbld-v0.38.1::https://github.com/carvel-dev/kbld/releases/download/v0.38.1/kbld-linux-arm64)
sha256sums_x86_64=(00e114286588307d0785c4bfb1bb8f68acca1ea186eb79cd8475214214413291)
sha256sums_aarch64=(dba78f59d887cc7433595a1e7754fcbc3a7a53f5fbbb23b2798d95114795ce78)
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

_z_binname="kbld"
