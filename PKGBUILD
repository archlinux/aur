# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_history
_name=trytond_purchase_history
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to historize purchases"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a9f9d48bba75ea0f755549802201dab4610a39f8159d76db145bc709fd46161f')
sha512sums=('96a0c8a2b3ca5ff82b50b87e3f69b1a1fa1c35ac73846db18543c1b07f035e6688baa60ce767a16608be864e00863e94dec9707279ef1b1dc41aad5e514c65c2')
b2sums=('95aa6233e0948896e578b5c21e1f7bd5e4dff321222822af493315cb06a96f9e5b299450889e5d1520130c642a4b289daba2fd7c05559ffa1acdc9f80d64f527')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
