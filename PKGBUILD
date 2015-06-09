# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Hideaki Takahashi <mymelo+aur@gmail.com>
# Maintainer: Vincent Demeester <vincent@sbr.pm>
python=python2

_libname=dockerpty
pkgname=python2-$_libname
pkgver=0.3.4
pkgrel=1
pkgdesc="Python library to use the pseudo-tty of a docker container"
arch=('any')
depends=('python2-docker-py')

url="https://github.com/d11wtq/dockerpty"
license=('Apache2')


source=(https://pypi.python.org/packages/source/d/dockerpty/dockerpty-$pkgver.tar.gz)
md5sums=('92fb66d28aa19bf5268e7e3935670e5d')

build() {
    cd $srcdir/$_libname-$pkgver

    $python setup.py build || return 1
}

package() {
    cd $srcdir/$_libname-$pkgver

    $python setup.py install --root=$pkgdir

    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
