# Maintainer: Chris Snell <chris dot snell at gmail point com>

pkgname=gimme-aws-creds
pkgver=2.3.4
pkgrel=1
pkgdesc='CLI tool for using Okta IdP to acquire temporary AWS credentials via STS'
arch=('any')
url="https://github.com/Nike-Inc/gimme-aws-creds"
license=('Apache')
depends=('python-botocore' 'python-dateutil' 'python-beautifulsoup4'
         'python-keyring' 'python-requests' 'python-fido2' 'python-okta')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('65a69dff8caf935e8e22eee9e8b41ae6e2c2b2b4cd86f0ea9170211be331b67dd3650d46948e227de9f33e51b05b3cfad61ce89dc34de2dd05fdba4991265ea0')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

