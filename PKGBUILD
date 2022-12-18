# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='codon-bin'
_pkgname="${pkgname%%-bin}"
pkgver=0.15.3
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
  '528da3af8cef003a57f9f76ee33c7814deb5b6f3eddc7998b7ab846b1a1e92f8'
   SKIP SKIP
)
sha512sums=(
  'cc4b100f55a02a0f7a6920668f7ab58986c2c77e76eab20e94def42ac740f054c450bc6d6ec11535db31e16fc32fa934d697f01bae9dfe5796e3d2f1c807f446'
  '31ce1236b96291ef0f0a42c9e5c39271c0fba55c1a11521c3e05ba691601e56664544534e5b452464bcf6baa514dc9536a0966ddaa66dcefd058151a065d1f9b'
   SKIP SKIP
)
b2sums=(
  '718328c0651e383b892e7c1f00b795f88c6f4775b02e3a2ba217873d105e51824f380ba55b8602d1698da12ee3609641a753a6aa7660d5d4df52ea855eca5ca7'
  '97944ece75f5f992000946e90f71fed4e565536283c0182d8403c50848259f19027664b7a7974489e03b9195ae3e6e719549bedab63d085c57a415a028dfc258'
   SKIP SKIP
)

# eof
