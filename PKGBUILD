# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Chris Tusa <linisys@gmail.com>
# Contributor: Thore Bunde <root [at] netpimp [dot] de>
pkgname=yum-metadata-parser
pkgver=1.1.4
pkgrel=7
pkgdesc="C-based metadata parser to quickly parse xml metadata into sqlite databases."
arch=('i686' 'x86_64')
license=('GPL')
url="http://pkgs.fedoraproject.org/repo/pkgs/yum-metadata-parser/"
depends=('python2' 'libxml2'  'glib2')
source=(http://pkgs.fedoraproject.org/repo/pkgs/yum-metadata-parser/yum-metadata-parser-1.1.4.tar.gz/05289971e5cfde532631f2a99f6c58c7/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f1560a284541feb720c3ae35b6b31f80c2be5cb9ca86b3a1ee9459846f821ada')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 ./setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 ./setup.py install --prefix="${pkgdir}/usr"
}
