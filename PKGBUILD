# Maintainer: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=4.1.1
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('dd50e5e68813990dcaba23564a0481f09550e3e80402ac0e4689685b7b8c46a4')

build() {
  cd "$pkgname-$pkgver"
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

# vim:set ts=2 sw=2 et:
