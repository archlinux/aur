# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.15.2
pkgrel=1
pkgdesc='High-performance, zero-overhead, extensible Python compiler using LLVM'
arch=('x86_64')
url='https://github.com/exaloop/codon'
_rawurl='https://raw.githubusercontent.com/exaloop/codon/develop'
license=('custom:Business Source License 1.1')
depends=(
  'openmp'
  'python-setuptools'
)
provides=('codon')
conflicts=('codon')
_tarball='codon-linux-x86_64.tar.gz'
source=(
  'codon.sh'
  "$url/releases/download/v$pkgver/$_tarball"
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
  'a6cb31780cd8ccc78b176dee5a0f4c662f4c3c2c397044f920b6366f67013f9f'
   SKIP SKIP
)
sha512sums=(
  'cc4b100f55a02a0f7a6920668f7ab58986c2c77e76eab20e94def42ac740f054c450bc6d6ec11535db31e16fc32fa934d697f01bae9dfe5796e3d2f1c807f446'
  '7b308dfdd71d85f3fdfdfdee8fafb5d4eb896c7c7e0ab450a64d0666280e941e23facf36e317e8c53ced56324348419ec997b0a980372ab06ee0aae957d856cb'
   SKIP SKIP
)
b2sums=(
  '718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
  '4f16ee943a6a1b0a9d9271f8b888772daee8effffe9a54fb3dc2802b27b1727affa55c986bff5df02ac9025c4d65673d7821a3c2d6ee275cff5a50ae6c90460b'
   SKIP SKIP
)

# eof
