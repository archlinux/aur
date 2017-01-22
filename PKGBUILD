# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>

pkgname=certbot-s3front
pkgver=0.2.0
pkgrel=2
pkgdesc="Amazon S3/Cloudfront plugin for Let’s Encrypt client"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'python2-boto3' 'python2-zope-component' 'python2-zope-interface'
         'python2-futures' # TODO: should be pulled by python2-s3transfer?
        )
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a458a6076ccc3b22bd4cf44a68dbdc0c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
