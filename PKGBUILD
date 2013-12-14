# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python2-mynt
pkgver=0.2.3
pkgrel=3
pkgdesc="A static site generator designed to give you all the features of a CMS."
arch=('any')
url="http://mynt.mirroredwhite.com/"
license=('BSD')
depends=('python2>=2.7' 'python2-houdinipy' 'python2-jinja>=2.7'
         'python2-misaka>=1.0.2' 'python2-pygments' 'python2-watchdog'
         'python2-yaml')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/mynt/mynt-${pkgver}.tar.gz"
        'jinja2_version.patch')
sha256sums=('364c9274f56ee44a109282927617658b873bdd809fe16322ca24f608a93503b0'
            '8c93eed1a0c4a7d9d5eec3d9008da1e5d5988b029fdd29c74daa0b2a396df621')

prepare() {
  cd "$srcdir/mynt-$pkgver"
  patch -Np0 -i ../jinja2_version.patch
}

package() {
  cd "$srcdir/mynt-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
