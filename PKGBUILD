# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=3.3.0
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('03f3484bc781a6d63486e763f30be421a313893c78b6f84137ea05319cda8c96')

build() {
  cd "$pkgname-$pkgver"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

# vim:set ts=2 sw=2 et:
