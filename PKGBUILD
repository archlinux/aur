# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>

pkgname=certbot-s3front
pkgver=0.4.2
pkgrel=2
pkgdesc="Amazon S3/Cloudfront plugin for Let’s Encrypt client"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'python-boto3' 'python-zope-component' 'python-zope-interface' 'python-mock')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8b77ef281375db22634952ff9e569d6c4cd83cc4ae40212a7c70be0b7ea49e0b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
