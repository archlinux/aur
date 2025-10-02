# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapnomnom-bin
_pkgname="${pkgname%-bin}"
pkgver=v1.5.1
pkgrel=1
pkgdesc="Active Directory ACL Visualizer and Explorer - who's really Domain Admin?"
arch=('x86_64')
url="https://github.com/lkarlslund/ldapnomnom"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-linux-x64-$pkgver::$url/releases/download/$pkgver/$_pkgname-linux-x64"
        "https://raw.githubusercontent.com/lkarlslund/ldapnomnom/refs/heads/main/license.MD"
        "https://raw.githubusercontent.com/lkarlslund/ldapnomnom/refs/heads/main/readme.MD")
sha512sums=('5eb0b1af0542d36f375d43efb86190633402ae0c2e55b780fa46041d76c7fe0ca51f0d1be6a1a05ab6983da980cdd7bafc5e20e2afeba9c6da843ae62fe3d410'
            '67a15fc6cae8dd9c4f0b5896fdf4e7ff2a3a8969575b2ca549ce9e6d342da2f244e9e35900b3cc1d3c0741bdf43d8488f59124a7ee6de64bc4dc6bee4eb8c03a'
            '3df8cfee282575b063571c8638c88451e48192ac5aafa67869d07a2cb6647d4e208cfababecf8f748d22aeee1e2cdf45fa4d9c2cd8b645ee847f055aabf35bd4')

package() {
  install -Dm0755 $srcdir/$_pkgname-linux-x64-$pkgver "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" license.MD
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" readme.MD
}

