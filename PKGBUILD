# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>

pkgname=certbot-s3front
pkgver=0.3.1
pkgrel=1
pkgdesc="Amazon S3/Cloudfront plugin for Let’s Encrypt client"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'python-boto3' 'python-zope-component' 'python-zope-interface')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('d3fe8c152cf4c9f1dcd17c4edd8008e3')
validpgpkeys=('F07D85CAA18ACF46A346FD017C7FC6EA8633B4EA')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
