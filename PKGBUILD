# Maintainer: aeneby <aaron (at) sowry (dot) nz>

pkgname=thinlinc-client
pkgver=4.21.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux remote desktop client"
arch=('x86_64')
url="https://cendio.com"
license=('custom')
options=(!debug)

# The ThinLinc client RPM includes a build number, so we have to define it
# here. Remember to update this along with the version number for each release.
buildnum="4588"

source=("https://www.cendio.com/downloads/clients/thinlinc-client-${pkgver}-${buildnum}.${arch[0]}.rpm")

sha256sums=('47ab445ffe9ab26240fbcd7b1bed807f06b11282dca24411d964dbf26afb8217')

package() {
    cp -aR "$srcdir"/{etc,opt,usr} "$pkgdir"

    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/thinlinc/lib/tlclient/EULA.txt" \
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
