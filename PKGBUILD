# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=csctl
pkgname=${_pkgname}-bin
pkgver=0.0.5 # renovate: datasource=github-releases depName=SovereignCloudStack/csctl
pkgrel=1
url="https://github.com/SovereignCloudStack/$_pkgname"
pkgdesc="csctl"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=($_pkgname)
depends=()
conflicts=("$_pkgname-git" "$_pkgname")
source_x86_64=("$_pkgname-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha512sums_x86_64=('e64897c7e9f2f34c976e4c68a51964804d061335b0dcd6357d467e2e38463a639003955287731b14b9880ffa4dac29631c50f02bf7596ab43036bdae21bc5753')
sha512sums_aarch64=('5c2a7a9b000a227bec1c7edfc366822dfbcb9e27720fbc11a11dc97ab3f12420af06e3782d7bc508eba4aae418db35b80268ddc5a55ff4a473c3e2df6a57ad02')

package() {
    install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion zsh >"$srcdir/zsh_$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion fish >"$srcdir/fish_$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion bash >"$srcdir/bash_$_pkgname"
    install -D -m 0644 "$srcdir/zsh_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -D -m 0644 "$srcdir/fish_$_pkgname" "$pkgdir/usr/share/fish/completions/$_pkgname.fish"
    install -D -m 0644 "$srcdir/bash_$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
