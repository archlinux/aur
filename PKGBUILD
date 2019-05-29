# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria
_pkgname=Limnoria
pkgver=20190223
_pkgver=2019-02-23
pkgrel=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('3-clause BSD')
depends=('python2')
makedepends=('git')
optdepends=("python2-charade: Detect page's encoding"
            "python2-pytz: Enable Time plugin to calculate the time in specified timezone"
            "python2-dateutil: Enable Time plugin to parse the input time string"
            "python2-gnupg: GnuPG support"
            "python2-feedparser: RSS plugin support"
            #"python2-sqlalchemy: Alternative DB engine when no SQLite3 engine installed" 
            # But SQLite module has already been integrated into python package, so it doesn't matter
            "python2-socksipy-branch: SOCKS proxy support"
            #"python2-mock: For testing only"
            "python2-ecdsa: ECDSA support")
conflicts=('limnoria-git')
source=("https://github.com/ProgVal/${_pkgname}/archive/master-${_pkgver}.tar.gz")
md5sums=('8632b454f0132ed6c527189e799d9f4e')

build() {
  cd "$srcdir/$_pkgname-master-${_pkgver}"
  
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-master-${_pkgver}"

  python2 setup.py install --root="$pkgdir" || return 1
}
