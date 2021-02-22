# Maintainer: Bastien Traverse <neitsab at esrevart dot net>

pkgname=brutha-git
pkgver=1.1.1.r3.g0d00a5b
pkgrel=1
pkgdesc="Batch synchronization of music, with FLAC to Ogg Vorbis, optional down-sampling, and straight copy of others"
arch=('any')
url="http://git.p.engu.in/laurentb/brutha/about/"
license=('GPL')
depends=('python2-mutagen' 'sox')
makedepends=('git' 'python2-setuptools')
optdepends=('parallel: for parallel runs'
            'make: for parallel runs'
            'vorbisgain: for --gain')
source=("git+git://git.p.engu.in/laurentb/brutha")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "${pkgname%-git}"
  python2 setup.py install --root="${pkgdir}"/ --optimize=1
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
