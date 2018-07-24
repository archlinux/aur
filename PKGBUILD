# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>

pkgname=certbot-s3front
pkgver=0.4.1
pkgrel=1
pkgdesc="Amazon S3/Cloudfront plugin for Let’s Encrypt client"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'python-boto3' 'python-zope-component' 'python-zope-interface')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e4b5c972a81ef762e5c6d7ac9fddf6b0383fb42558976f071aa96b2315713cab')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
