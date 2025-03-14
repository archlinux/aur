# Maintainer: pusi77 <pusineriandrea+gmail+com>

_name=Subrake
pkgname=subrake
pkgver=4.1
pkgrel=2
pkgdesc="A DNS automated scanner and tool (Zone Transfer, DNS Zone Takeover, Subdomain Takeover)."
arch=(any)
url="https://github.com/hash3liZer/Subrake"
license=(GPL-3.0)
depends=(python-dnspython python-requests python-bs4 python-screeninfo)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6c364f36be763a344a1af8a0036c0fa48f86a1331a78c038c8f4ffc32385c38')

# build() {
#   cd Subrake-${pkgver}
#   python -m compileall .
#   python -O -m compileall .
# }

# package() {
#   cd SubDomainizer-${pkgver}
#   install -d "${pkgdir}/opt/${pkgname}"
#   install -d "${pkgdir}/usr/bin/"
#   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#   cp -a --no-preserve=ownership * "${pkgdir}/opt/${pkgname}"
#   cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
# #!/bin/sh
# cd /opt/${pkgname}
# python SubDomainizer.py "\$@"
# EOF
#   chmod 755 "${pkgdir}/usr/bin/${pkgname}"
# }

makedepends=('python-setuptools')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
