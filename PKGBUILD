# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
pkgname=trac-tagsplugin
pkgver=0.7
pkgrel=2
pkgdesc="A tagging system for Trac."
arch=('any')
url="http://trac-hacks.org/wiki/TagsPlugin"
license=('custom')
depends=('trac>=1.0')
makedepends=('subversion' 'python2-setuptools')
source=(svn+https://trac-hacks.org/svn/tagsplugin/tags/$pkgver#revision=13816
        tractags.patch)
md5sums=('SKIP'
         '8945d5608013c28198d9cfbbad2932d6')

prepare() {
    cd "$srcdir/$pkgver"
    patch -p0 < ../tractags.patch
}

package() {
    cd "$srcdir/$pkgver"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
