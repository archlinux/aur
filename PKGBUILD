# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=cloudflare-dynamic-dns-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="Updates AAAA records at Cloudflare according to the current IPv6 address"
url="https://github.com/Zebradil/cloudflare-dynamic-dns"
arch=(x86_64 aarch64)
license=(MIT)
groups=()
backup=()
depends=()
depends_x86_64=()
depends_aarch64=()
makedepends=(go)
makedepends_x86_64=()
makedepends_aarch64=()
checkdepends=()
checkdepends_x86_64=()
checkdepends_aarch64=()
optdepends=()
optdepends_x86_64=()
optdepends_aarch64=()
conflicts=(cloudflare-dynamic-dns)
conflicts_x86_64=()
conflicts_aarch64=()
provides=(cloudflare-dynamic-dns)
provides_x86_64=()
provides_aarch64=()
replaces=()
replaces_x86_64=()
replaces_aarch64=()
source=()
source_x86_64=(cloudflare-dynamic-dns-bin-2.3.2::https://github.com/zebradil/cloudflare-dynamic-dns/releases/download/2.3.2/cloudflare-dynamic-dns_linux_amd64.tar.gz)
source_aarch64=(cloudflare-dynamic-dns-bin-2.3.2::https://github.com/zebradil/cloudflare-dynamic-dns/releases/download/2.3.2/cloudflare-dynamic-dns_linux_arm64.tar.gz)
sha256sums_x86_64=('10358bd3e5194f8ece6bcbdd4c37fbd4f02aa0e8a410571114c4fc96f3bf8ea9')
sha256sums_aarch64=('10358bd3e5194f8ece6bcbdd4c37fbd4f02aa0e8a410571114c4fc96f3bf8ea9')
package () 
{ 
    _name=${pkgname%-bin};
    BIN=$_name;
    install -Dm755 $BIN -t "$pkgdir/usr/bin";
    install -Dm644 systemd/* -t "$pkgdir/usr/lib/systemd/system";
    install -m700 -d "$pkgdir/etc/$_name/config.d";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$BIN completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$BIN";
    ./$BIN completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$BIN.fish";
    ./$BIN completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$BIN"
}
