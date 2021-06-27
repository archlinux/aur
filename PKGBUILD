# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname='bitcanna-wallet-bin'
pkgver=1.0.2
pkgrel=3
_srcdir='unix_13_03_20'
pkgdesc='Full node BitCanna (BCNA) versions of bitcannad, bitcanna-cli, bitcanna-qt, and bitcanna-tx, w/GUI and wallet'
arch=('x86_64')
url='https://www.bitcanna.io/'
license=('AGPL3')
depends=(
  'fontconfig'
  'libx11'
)
provides=(
  'bitcannad'
  'bitcanna-cli'
  'bitcanna-qt'
  'bitcanna-tx'
)
source=(
  "https://github.com/BitCannaGlobal/BCNA/releases/download/$pkgver/bcna-${pkgver}-unix.zip"
  'README.md'
)
md5sums=(
  '8cfe5fa2b780e7d9ea291712261f09a2'
  '6976dc7021d9823abad0620645c04912'
)
sha1sums=(
  '2d008317bada3f9c3d2a97b48a63d95d3e40476a'
  'dfdb908123db5667b9b283a3fd5959643f88c759'
)
sha256sums=(
  '05ef8255219d3636c6f333be70fc66d2926322f3d07529803377f47eafe056be'
  '28ca475234f43c151e055167597874e50b3e14a2bb7355b780fe9f3b8686e0d2'
)
sha512sums=(
  'd827d4c160c0f8b5511464ba2712d360783561a55929314c79ae09d2a4409a229823ebd00fe12025fa10bbe88eeaf3a50698f2ad228a099113ce01ba8108225d'
  'a05a9c813d0b647e51f97047c3eb9f92f0e2b70304516ce577790382205d7d68cbdf05478e8aaa3d6e4a836c70b9712b75751110eb3c8612ff6e9df1599eb165'
)
b2sums=(
  'fe023fe3ab7620a763bb13b01fcf725f78ebf40c9e443c023803a20c15816549c5d0cf468c82b0dfee1daa7cd57020b9e4e8783b68c8c3e8c809acd08128e508'
  '6be6ef8e26795f9d0827ade00a279c3148ea04e631f5c58c17f17a2bc3601f59e6e3a269196021ee27059d477c8b2d47d6f7f5dff537e65618d5a5116da69737'
)

package() {
  cd "$srcdir" || exit 1

  for fname in README.md; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done

  cd "$srcdir/$_srcdir" || exit 1

  for fname in bitcannad bitcanna-cli bitcanna-qt bitcanna-tx; do
    install -Dm0755 "$fname" "$pkgdir/usr/bin/$fname"
  done
}

# eof
