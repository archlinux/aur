# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

_pkgname='bitcanna-wallet'
pkgname="${_pkgname}-bin"
pkgver=1.0.3
pkgrel=4
pkgdesc='Full node BitCanna (BCNA) versions of bitcannad, bitcanna-cli, bitcanna-qt, and bitcanna-tx, w/GUI and wallet'
arch=('x86_64')
url='https://www.bitcanna.io/'
_url='https://github.com/BitCannaGlobal/BCNA_bitcore_old'
_rawurl='https://raw.githubusercontent.com/BitCannaGlobal/BCNA_bitcore_old'
license=('AGPL3')
depends=(
  'fontconfig'
  'libx11'
)
provides=(
  'bitcanna-wallet'
  'bitcannad'
  'bitcanna-cli'
  'bitcanna-qt'
  'bitcanna-tx'
)
conflicts=(
  'bitcanna-wallet'
)
source=(
  "$_url/releases/download/$pkgver/bcna-${pkgver}-unix.zip"
  "README.md::$_rawurl/master/README.md"
  "CONTRIBUTING.md::$_rawurl/master/CONTRIBUTING.md"
)
install='bitcanna-wallet-bin.install'
md5sums=(
  '39a3176eeef8491710b18b66a6eb469c'
  'SKIP'
  'SKIP'
)
sha1sums=(
  'd4ba64f8c77b1aa28e761ae9a4c8497d9a8fdfd7'
  'SKIP'
  'SKIP'
)
sha256sums=(
  '443369065c4ab9af67e64387228fca9d24cb7eedc8828ea243e3bf07bd08872c'
  'SKIP'
  'SKIP'
)
sha512sums=(
  '3352a219f16abf59d865780a6c210a004663d11807c4dcfde5939514c55aa461f3289c3555fcb98efff260a64b7c068aefa188d827a344474ac868ca327ab160'
  'SKIP'
  'SKIP'
)
b2sums=(
  'e4eddc3db4360671ca59b73a6b589625294a0b582c6db219bd6c9feebd576e1ba4b6fbcbaea2741b963d364b4f262ee92c2861b6161f6da39481e7b2416bdb2c'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir" || exit 1

  for fname in README.md CONTRIBUTING.md; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done

  cd "$srcdir" || exit 1

  for fname in bitcannad bitcanna-cli bitcanna-qt bitcanna-tx; do
    install -Dm0755 "$fname" "$pkgdir/usr/bin/$fname"
  done
}

# eof
