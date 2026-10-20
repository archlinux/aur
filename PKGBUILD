# Maintainer: Nikita Kolmogorov <backmeupplz@gmail.com>
# pkgver and both sha256sums are filled in for each release by .github/workflows/release.yml
pkgname=plain-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Compile, test and deploy EVM smart contracts with a single binary that needs no setup'
arch=('x86_64')
url='https://getplain.org'
license=('MIT')
depends=('glibc' 'libgcc')
provides=('plain')
conflicts=('plain')
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/backmeupplz/plain/v$pkgver/LICENSE")
source_x86_64=("plain-$pkgver-x86_64.tar.gz::https://github.com/backmeupplz/plain/releases/download/v$pkgver/plain-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('33114a696d51853ad80231c4402b355e0c145f37b6ead0020fd0c9285f68626d')
sha256sums_x86_64=('128e55f95b3b8689c3f5d53ff68be5bc64f676bdd55c3e6150b91f24b949dd65')

package() {
  install -Dm755 plain "$pkgdir/usr/bin/plain"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
