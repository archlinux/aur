# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

_pkgname='bitcanna-wallet'
pkgname="${_pkgname}-bin"
pkgver=1.0.2
pkgrel=4
_srcdir='unix_13_03_20'
pkgdesc='Full node BitCanna (BCNA) versions of bitcannad, bitcanna-cli, bitcanna-qt, and bitcanna-tx, w/GUI and wallet'
arch=('x86_64')
url='https://www.bitcanna.io/'
_url='https://github.com/BitCannaGlobal/BCNA'
_rawurl='https://raw.githubusercontent.com/BitCannaGlobal/BCNA'
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
  "$url/releases/download/$pkgver/bcna-${pkgver}-unix.zip"
  "README.md::$_rawurl/master/README.md"
  "CONTRIBUTING.md::$_rawurl/master/CONTRIBUTING.md"
)
md5sums=(
  '8cfe5fa2b780e7d9ea291712261f09a2'
  'SKIP'
  'SKIP'
)
sha1sums=(
  '2d008317bada3f9c3d2a97b48a63d95d3e40476a'
  'SKIP'
  'SKIP'
)
sha256sums=(
  '05ef8255219d3636c6f333be70fc66d2926322f3d07529803377f47eafe056be'
  'SKIP'
  'SKIP'
)
sha512sums=(
  'd827d4c160c0f8b5511464ba2712d360783561a55929314c79ae09d2a4409a229823ebd00fe12025fa10bbe88eeaf3a50698f2ad228a099113ce01ba8108225d'
  'SKIP'
  'SKIP'
)
b2sums=(
  'fe023fe3ab7620a763bb13b01fcf725f78ebf40c9e443c023803a20c15816549c5d0cf468c82b0dfee1daa7cd57020b9e4e8783b68c8c3e8c809acd08128e508'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir" || exit 1

  for fname in README.md CONTRIBUTING.md; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done

  cd "$srcdir/$_srcdir" || exit 1

  for fname in bitcannad bitcanna-cli bitcanna-qt bitcanna-tx; do
    install -Dm0755 "$fname" "$pkgdir/usr/bin/$fname"
  done
}

# eof
