# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.16.2
pkgrel=1
pkgdesc='High-performance, zero-overhead, extensible Python compiler using LLVM'
arch=('x86_64')
url='https://github.com/exaloop/codon'
_rawurl='https://raw.githubusercontent.com/exaloop/codon/develop'
license=('custom:Business Source License 1.1')
depends=(
  'cython'
  'gcc-libs'
  'glibc'
  'python'
  'python-astunparse'
  'python-setuptools'
  'sh'
)
provides=('codon')
conflicts=('codon')
_tarball="codon-$pkgver.tar.gz"
source=(
  'codon.sh'
  "$_tarball::$url/releases/download/v$pkgver/codon-linux-$CARCH.tar.gz"
  "$_rawurl/LICENSE"
  "$_rawurl/README.md"
)
noextract=("$_tarball")

package() {
  umask 022
  install -dm0755 "$pkgdir/opt"

  bsdtar -xf "$_tarball" -C "$pkgdir/opt"

  install -Dm0755 codon.sh  "$pkgdir/usr/bin/codon"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'ac8fa16770f809daf61c3726194b71c0561791a83831a246fab4929ef6395d9f'
  '220b4b89ebdcb6e52fdce1ce64ece28618593cc888e606c86a2d66c549d12e36'
  'SKIP' 'SKIP'
)

b2sums=(
  '718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
  'bd0385c5456336abcfc6f0109d02eb2fb0d3b3c0b84acafc5774e7eeab03aeb3ff901d08f2aa720acd295e6062aece2e63c752c6d361ad7df8219c1e14fe339c'
  'SKIP' 'SKIP'  # Skip to my Lou
)

# eof
