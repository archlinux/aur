# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-sphinx-markdown-tables'
_pkgname=${pkgname#python-}
pkgver=0.0.15
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc='Sphinx extension for rendering tables written in markdown'
url="https://github.com/ryanfox/$_pkgname"
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
depends=(
  'python'
  'python-markdown'
)
md5sums=(
  'f7ef0287d5d8ff06e7f6fdd96c1ed27a'
)
sha1sums=(
  'e164f793df5ecf4244e6018d36d0994d6a2ab863'
)
sha256sums=(
  'a8e846eed203f5bbe9de3296ecd8cc0b37be2b65cb171c1198c55d67f007b0a1'
)
sha512sums=(
  'e47eda8be9cd82d55def2bc11da2193830e745a27443ebf52a7fcb6457ab071ea1216106676388d3f66a129638e195c9e479bef41205e37c0dd490a184f0db6c'
)
b2sums=(
  '4ad974678fe2f99f7c69b63e2e98bc11dfcea088b08d39600be708449c3e6da29e12ff6d10cba7f0f33fc3db1a550504b21ed2b16047cdfd3d804afca0b73df6'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  rm -vf "$pkgdir/usr/LICENSE"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
