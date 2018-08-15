# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria
_pkgname=Limnoria
pkgver=20180625.2
_pkgver=2018-06-25-2
pkgrel=1
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features (dev channel)"
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
source=("https://github.com/ProgVal/${_pkgname}/archive/master-${_pkgver}.tar.gz")
md5sums=('71ccd3004ddfb8a7bca7114cab40bb72')

build() {
  cd "$srcdir/$_pkgname-master-${_pkgver}"
  
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-master-${_pkgver}"

  python2 setup.py install --root="$pkgdir" || return 1
}
