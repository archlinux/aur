# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=finduncommonshares
_upstream=FindUncommonShares
_upstream_new="pyFindUncommonShares"
pkgver=3.2
pkgrel=2
pkgdesc="Python script allowing to quickly find uncommon shares in vast Windows Domains..."
arch=('any')
url="https://github.com/p0dalirius/pyfinduncommonshares"
license=('GPL-2.0-only')
depends=('python'
         'impacket'
         'python-xlsxwriter'
         'python-sectools'
         'python-pycryptodome')
provides=("$pkgname")
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/p0dalirius/pyFindUncommonShares/refs/heads/main/LICENSE")
sha512sums=('ac08d503dbb4fd67ba017ef41a8b5e3292b0cf42a41bf33ea46c65d26ec4e32a5b659ebde75365e167d65ba2fcafd54fe2c6fac2f3ac98f9d1bf9ee26fd9d349'
            'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

package() {
  install -Dm0755 $srcdir/$_upstream_new-$pkgver/FindUncommonShares.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

