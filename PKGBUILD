# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helmrelease-tools
pkgname=$_pkgname
pkgver=2.12.6
pkgrel=2
pkgdesc="Scripts to work with flux HelmReleases"
license=('Apache-2.0')
arch=('x86_64')
depends=("yq" "git" "helm" "fd" "ripgrep" "helm-diff" "zsh")
source=("hr" "hrDiff" "hrInstall" "hrUpgrade" "helmrelease" "hrUninstall" "_$pkgname")
sha512sums=('ec0c945d04644975db3f6df538520475a16b6ab3bda3d0b3e331cd978b27574b215194bad48a015a77ad087a2aea4d49898e66a0f0e138d2d137791a29d5377f'
            'feb3e4874d5094cc8b8be3f00b7bfe474dc16f6cb0c7adf141ae30e8a59d5e148596b0a58e66a7b9d86b523e00e3b81084ca229fb31ddd734830f0cba792dd14'
            '641ebf0b0a6db993c7b38135cc6b44b05ad684e2032571a5bddf786486871eefe2a3dd54fdce7568d9af15352fc480acf105248e0007b3a0802515582d3117cf'
            '758350abf5f96a5fbd3bbb53b93a32e5517bf81bd6d67442e14f0f23d55b25142849d5ed7c2f721a5fa05f375c92dd472b69c9ffbaefb7e04c25f1f627e6b6ce'
            '2008428d42e12dca7e49dc572c72635d0b2873df1dc5427456fd13ff045b20d951421a3b211cf62cda00478917f0cd7c1495aeb5ec5f14720a946e1dd2cef734'
            '3d0c0e7efad29577c944d631188ee86183b53a0a9e72b294c30101b202842a2d2af2c93d18628b768606e9cfff078a55e8f7b9164351ce069bc1f1553127ece0'
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
