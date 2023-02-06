# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.15.5
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
  '957b6a27c0cc6c987d9d302954c93241314007856053c25a2116582774959198'
  'SKIP' 'SKIP'
)
sha512sums=(
  'cc4b100f55a02a0f7a6920668f7ab58986c2c77e76eab20e94def42ac740f054c450bc6d6ec11535db31e16fc32fa934d697f01bae9dfe5796e3d2f1c807f446'
  '8fb2a7b63979fef98f69c7ea46f0443d1b160dfe7fe40785c864577384291819dd968958fd32f4e376d55ef145d8a2ad033fce12660c58933004e420192b3df9'
  'SKIP' 'SKIP'
)
b2sums=(
  '718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
  'aa423f97dabecc81a4691eaa8379b7b73129b12de1538e0cd7f8dab566804fb692e373d647c1f59f3de00cd1e62bfffd8b65219b85c39cf1a83354d80e5a9f9c'
  'SKIP' 'SKIP'
)

# eof
