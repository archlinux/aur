# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Maintainer: tee < teeaur at duck dot com >

pkgname=codon-bin
pkgver=0.19.6
pkgrel=1
pkgdesc='High-performance, zero-overhead, extensible Python compiler using LLVM'
arch=(x86_64)
url='https://github.com/exaloop/codon'
_rawurl="https://raw.githubusercontent.com/exaloop/codon/v$pkgver"
license=('Apache-2.0')
depends=(
  'cython'
  'gcc-libs'
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
  "README-$pkgver.md::$_rawurl/README.md"
)
noextract=("$_tarball")

package() {
  umask 022
  install -dm0755 "$pkgdir/opt"

  bsdtar -xf "$_tarball" -C "$pkgdir/opt"

  install -Dm0755 codon.sh  "$pkgdir/usr/bin/codon"
  install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/codon/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

b2sums=('751dc54eea16f18c88976bd30436c24dce3d2d03aa0e6c2ef323a4393738ef01c79739fc2c5073bdacd7f5282aa0c7b38af575209de9458085c10abcda571a81'
        'e65b0e83b1b6684885d7d7e89d444074297e2070eb0e9a1ca17341b53ba265ad107c83c2f43108d37aa6c1949e2503e126b604cfd6bc2920fad20792544a2117'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
        'c9a8ac98fdeebacd0584bd89cb449b43400296c11c1c8a7dea2ebdd469000451e11d8daf42b9bbbe322eb016bd7e5d338b94f0e72594e6fccd0aaf329a14edc6')

# eof
