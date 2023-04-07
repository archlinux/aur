# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-nose-show-skipped
pkgver=0.1
pkgrel=10
pkgdesc="A nose plugin to show skipped tests and their messages"
arch=('any')
url="https://github.com/cpcloud/nose-show-skipped"
license=('BSD')
depends=('python-nose')
makedepends=('python-setuptools' 'python-nose')
source=("https://pypi.python.org/packages/source/n/nose-show-skipped/nose-show-skipped-$pkgver.tar.gz"
        'LICENSE')
sha512sums=('b6f3cbc8fdc6af7f6298ad54a5b06bd053d27197368eef1e006aff438d517dba549154eb3be35996b0bd1c291537729438f52709b76c507e20c496b6e504f5df'
            '3f9813adb48ca13f52ef119a6c313da4863ff02a8fabe37d48b1b2aa91b13ba672b21d7e7737a74e9c1a7647896bec0181237aa0ca693780419f49ef280a5082')

build() {
  cd "$srcdir/nose-show-skipped-$pkgver"
  python setup.py build
}

package() {
  cd nose-show-skipped-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
