# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=limnoria
_pkgname=Limnoria
pkgver=20200319
_pkgver=2020-03-19
pkgrel=3
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features"
arch=('any')
url="https://github.com/ProgVal/Limnoria"
license=('3-clause BSD')
depends=('python>=3.4')
makedepends=('git')
optdepends=("python-charade: Detect page's encoding"
    "python-pytz: Enable Time plugin to calculate the time in specified timezone"
    "python-dateutil: Enable Time plugin to parse the input time string"
    "python-gnupg: GnuPG support"
    "python-feedparser: RSS plugin support"
    "python-sqlalchemy: Aka plugin support"
    "python-pysocks: SOCKS proxy support"
    "python-mock: For testing only"
    "python-cryptography: ECDSA support")
conflicts=('limnoria-python3' 'limnoria-git' 'limnoria-python3-git')
source=("https://github.com/ProgVal/Limnoria/archive/master-${_pkgver}.tar.gz")
md5sums=('bb59a048419c08dd7de1943f313dc39a')
install=".install"

build() {
    cd "$srcdir/$_pkgname-master-${_pkgver}"

    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-master-${_pkgver}"

    python3 setup.py install --root="$pkgdir" || return 1
}
