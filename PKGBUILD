# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgbase=limnoria-git
pkgname=("limnoria-git" "limnoria-python3-git")
_pkgname=Limnoria
pkgver=20200211
pkgrel=2
pkgdesc="An IRC bot based on Supybot, with sqlite3 support and other features (dev channel)"
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
conflicts=('limnoria' 'limnoria-python3')
source=("git://github.com/ProgVal/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    sed -n '1s/[^[:digit:]]//gp' src/version.py
}

build() {
    cd "$srcdir/$_pkgname"

    python3 setup.py build
}

package_limnoria-git() {
    cd "$srcdir/$_pkgname"

    python3 setup.py install --root="$pkgdir" || return 1
}

package_limnoria-python3-git() {
    msg "This package contains nothing and is only for migration,"
    msg "and will be removed in next release."
}
