# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=finduncommonshares
_upstream=FindUncommonShares
_upstream_new="pyFindUncommonShares"
pkgver=3.3
pkgrel=1
pkgdesc="Python script allowing to quickly find uncommon shares in vast Windows Domains..."
arch=('any')
url="https://github.com/p0dalirius/pyfinduncommonshares"
license=('GPL-2.0-only')
depends=('python'
         'impacket'
         'python-xlsxwriter'
         'python-sectools'
         'python-pycryptodome'
         'python-dnspython')
provides=("$pkgname")
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/p0dalirius/pyFindUncommonShares/refs/heads/main/LICENSE")
sha512sums=('863dfedf860a230292dc4d00c1794768fdd6a9c2ca14cf8eb44921e4fca8bf35e5475154c1b4edc2f802c8aa974a5d0d35897ad32c127f43387789cb60357e6f'
            'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

package() {
  install -Dm0755 $srcdir/$_upstream_new-$pkgver/FindUncommonShares.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

