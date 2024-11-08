# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapnomnom-bin
_pkgname="${pkgname%-bin}"
pkgver=v1.5.0
pkgrel=1
pkgdesc="Active Directory ACL Visualizer and Explorer - who's really Domain Admin?"
arch=('x86_64')
url="https://github.com/lkarlslund/ldapnomnom"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-linux-x64-$pkgver::$url/releases/download/$pkgver/$_pkgname-linux-x64"
        "https://raw.githubusercontent.com/lkarlslund/ldapnomnom/refs/heads/main/license.MD")
sha512sums=('68709550af2941177fc5f4fb00667df2f882bab5c7a938a65e8bca52fbe3ffed353a4c66e7cbde34351b27229c35e675be6f9f229f11aa6c40e2adcc256404bf'
            '67a15fc6cae8dd9c4f0b5896fdf4e7ff2a3a8969575b2ca549ce9e6d342da2f244e9e35900b3cc1d3c0741bdf43d8488f59124a7ee6de64bc4dc6bee4eb8c03a')

package() {
  install -Dm0755 $srcdir/$_pkgname-linux-x64-$pkgver "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" license.MD
}

