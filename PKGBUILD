# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=dnsdiag
pkgver=2.5.0
pkgrel=1
pkgdesc='DNS Measurement, Troubleshooting and Security Auditing Toolset'
arch=('any')
url='https://dnsdiag.org'
license=('BSD-2-Clause')
depends=(
  'python'
  'python-cryptography'
  'python-cymruwhois'
  'python-dnspython'
  'python-h2'
  'python-httpx'
)
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/farrokhi/dnsdiag/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c79e2895c8661f607a5a20a3e814042f152bb489d05e450ccdd889222b87f38f')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
