# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=2.14.0
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
            'c4319fd59d6588022d80e470d2c940a6032666a9f655bbb537b60bd5eec78f70c0f01125a0a2918b55dde37777a359f2673f3b69da0bc9b3c977a8c2f1cecd94'
            '016c784c97d1659f5c625c89637f9bb1fb7a74b549cb72c1104c77fa322b7c8139b9f87e4d763fffc79b68c7f1e6643d866401ac979cf3b815ad83a1d9c3363d'
            '2ce887e0cf3e3e2d5dab1208edb37a0b89bf398b8cd453de44c91d27580d1b9b22279f5b48767fddc98196cd568f7d38dd7bea4908e25e96d32150a9eb15b322')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -t "$pkgdir/usr/share/zsh/site-functions" "$srcdir/_$pkgname"
  for s in "${source[@]}"; do
    [[ "$s" == "_$pkgname" ]] && continue
    install -D -t "$pkgdir/usr/bin" "$srcdir/$s"
  done
}

#vim: syntax=sh
