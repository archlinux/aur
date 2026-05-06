# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=2.13.0
pkgrel=1
pkgdesc="Scripts to work with flux HelmReleases"
license=('Apache-2.0')
arch=('x86_64')
depends=("yq" "git" "helm" "fd" "ripgrep" "helm-diff" "zsh")
source=("hr" "hrDiff" "hrInstall" "hrUpgrade" "helmrelease" "hrUninstall" "_$pkgname")
sha512sums=('9091b49f1c6d544be7c3d2e35c02004ef0f4b6bd2398afca89933a13776f89f6937b268c476453ae00f1e26200f664bbe014fe5d9a2359cf3fcfc7bc3727219f'
            '9ab4db8699b863eba46ba3d35a28606b22ceb181379c92e68e513fa4c47d2341f311d258498cccab7cd97853ef880e6235d997603d63a6b1ff35dff8e011bc5b'
            '83e325012446282e912bc0b04d5ad18760b1d4f62b58eb06279f08f45c6fa3f809019475e0f44fdd51734711e377f62d0b1f18618b1cd5c5ceb24186d6669704'
            '3e97c8eeb5455fb814ca619f34acf02e3442d467ae4704435bc2d826a1c3b098bae1a2f0be7e5b320109c4384192aafdc66a6c04bae792791ec495da1c57f446'
            '9006d1261c22d1df7ed85119a62c5b662f1d16c5ebd8d4e244b15927769e69dba738f056f32e890f94149f24ff104254ebc178c28d89bca0ea246ba6c9ee70bf'
            '016c784c97d1659f5c625c89637f9bb1fb7a74b549cb72c1104c77fa322b7c8139b9f87e4d763fffc79b68c7f1e6643d866401ac979cf3b815ad83a1d9c3363d'
            'b773209b957fd9c90c82e39507cfb549c4d2bb55f8fdc49a7d61d0ef72331810f21cb6d8c9d5885b8dad948c2f6c8cdab745894bd986e857582039ed434784f1')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -t "$pkgdir/usr/share/zsh/site-functions" "$srcdir/_$pkgname"
  for s in "${source[@]}"; do
    [[ "$s" == "_$pkgname" ]] && continue
    install -D -t "$pkgdir/usr/bin" "$srcdir/$s"
  done
}

#vim: syntax=sh
