# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.15.4
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
  'a2361358dae5d4985db3f6c45fa2ca86feb3f4bf79174f15dbc0b0d3a159c990'
  'SKIP' 'SKIP'
)
sha512sums=(
  'cc4b100f55a02a0f7a6920668f7ab58986c2c77e76eab20e94def42ac740f054c450bc6d6ec11535db31e16fc32fa934d697f01bae9dfe5796e3d2f1c807f446'
  '37310a289dda25818961cbb574b76871ae44d1d9dc6fb75fa5f4ad143610a8e3d57e0c6291bbd2847438b8a8820cfde4550d35a9dfce1aa7677bcf4d498b85e2'
  'SKIP' 'SKIP'
)
b2sums=(
  '718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
  'f7e41539354fee0757f3d9c6b28daa98c718f070194a07363d37d14b7d7f28b68d6090fbcc78945396d13d4c0da1b7c5aae3967a742fbc4620480b2a79c22d32'
  'SKIP' 'SKIP'
)

# eof
