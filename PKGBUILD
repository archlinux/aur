# Maintainer: Chris Snell <chris dot snell at gmail point com>

pkgname=gimme-aws-creds
pkgver=2.4.3
pkgrel=1
pkgdesc='CLI tool for using Okta IdP to acquire temporary AWS credentials via STS'
arch=('any')
url="https://github.com/Nike-Inc/gimme-aws-creds"
license=('Apache')
depends=('python-botocore' 'python-dateutil' 'python-beautifulsoup4'
         'python-keyring' 'python-requests' 'python-fido2' 'python-okta'
         'python-boto3')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('740f3460b535346342177dd3139a139440358ab186f38d9129214176a446c7628f7a02ac4dd7e1e7315352a60c6d329168cbc066b6d35c8fa9f097593f230a13')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

