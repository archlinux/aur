# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=2.2.1
pkgrel=1
pkgdesc="Scripts to work with flux HelmReleases"
license=('APACHE')
arch=('x86_64')
depends=("yq" "git" "helm" "fd" "ripgrep" "helm-diff")
source=("hr" "hrDiff" "hrInstall" "hrUpgrade" "helmrelease" "hrUninstall" "_$pkgname")
sha512sums=('ec0c945d04644975db3f6df538520475a16b6ab3bda3d0b3e331cd978b27574b215194bad48a015a77ad087a2aea4d49898e66a0f0e138d2d137791a29d5377f'
            '4b182b0453b980e66f9fafa7b4077f4397c1595a9cbada6f9b251b8f13bf30c939cbf1fbfe3c0e12396ae18efa8f9b281cdd8d3fcc9208fd27166acbde528294'
            '641ebf0b0a6db993c7b38135cc6b44b05ad684e2032571a5bddf786486871eefe2a3dd54fdce7568d9af15352fc480acf105248e0007b3a0802515582d3117cf'
            '758350abf5f96a5fbd3bbb53b93a32e5517bf81bd6d67442e14f0f23d55b25142849d5ed7c2f721a5fa05f375c92dd472b69c9ffbaefb7e04c25f1f627e6b6ce'
            '16b3978ac6d44a6f54c4647562ce7aa203e819cdbb9c8bc3c73f4f1c826015fb36c814082555197e0cd2c30874538017ccb5f4a6423f0f5d4169e541b3c42e93'
            '3d0c0e7efad29577c944d631188ee86183b53a0a9e72b294c30101b202842a2d2af2c93d18628b768606e9cfff078a55e8f7b9164351ce069bc1f1553127ece0'
            'ff7a5fa4111c6e83a00b9e6731b6bfb6770600ed371d11f1347566fd81e7eb9e21993b9187012b426b4ae2080117953910bf75fc0b67ab1f345e7a702e3e2aa5')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -t "$pkgdir/usr/share/zsh/site-functions" "$srcdir/_$pkgname"
  for s in "${source[@]}"; do
    [[ "$s" == "_$pkgname" ]] && continue
    install -D -t "$pkgdir/usr/bin" "$srcdir/$s"
  done
}

#vim: syntax=sh
