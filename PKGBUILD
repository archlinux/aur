# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.16.0
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
  "$_tarball::$url/releases/download/v$pkgver/codon-linux-x86_64.tar.gz"
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
  '38c5cf4a31cdf3ff63073172fa55f62f72783c527bc45e4a42186a1ae4778ba5'
  'SKIP' 'SKIP'
)
sha512sums=(
  'cc4b100f55a02a0f7a6920668f7ab58986c2c77e76eab20e94def42ac740f054c450bc6d6ec11535db31e16fc32fa934d697f01bae9dfe5796e3d2f1c807f446'
  '0c5c744d6a81aeee00168003b751b0cd22527391e8719e979ffa160ad248ef2a9f707f7b788a73eef3124bcf20b73261a820a952bb525649e24235daa1b76c58'
  'SKIP' 'SKIP'
)
b2sums=(
  '718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
  '91afda73665f8e65f35e8aaeb3a8b35f275db9a06c662506fc4a8e6121a5c759a2c4b99539d2000d7cc2a731fca4d2cf83952edb7870a37754e8055886f0a6d1'
  'SKIP' 'SKIP'  # Skip to my Lou
)

# eof
