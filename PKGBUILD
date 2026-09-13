# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Network_Jack <Network_Jack@null.net>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.8
pkgrel=1
pkgdesc="Set of security tools that can be used to audit SIP based VoIP systems"
arch=(any)
url="https://github.com/EnableSecurity/sipvicious"
license=(GPL-2.0-or-later)
depends=(python)
optdepends=(
    'python-scapy: allow svcrash to crash SIPVicious toolset'
    'python-reportlab: export reports to PDF with sipvicious_svreport'
    'python-dnspython: SRV lookups with sipvicious_svmap --srv'
)
makedepends=(python-build python-installer python-wheel python-setuptools)
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('66abe8a2b3c9423e31875f3c7e0d05cf174a876cbc3ffbc8d3fe1fa982ce7da7a16f18cc5a267d46795cdcd3bcba29f4684dc7a9fd3d67473cadda294a52af22')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
