# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Network_Jack <Network_Jack@null.net>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sipvicious
pkgver=0.3.7
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
b2sums=('1c309a2aa996c5e34d2be85d459e4f47280467bc7178518767832bea9c55c85d9b22fff78f815cd7677eeaa882bf70955139e334ddf7a604bc62a37b6bfaaac6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
