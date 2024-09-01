# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='A modern watch command, binary version'
url="https://github.com/sachaos/viddy"
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz" "LICENSE" "README.md")
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=('viddy')
provides=('viddy')
sha256sums=('d0c22d069349ce9ffc9fcda3c5f5e06312ea6813a986b2b860934830fd1f5f06'
            'e6eea22d4e9e0aa6a78d0f9126009ec041ea047f94b320c003c34a631821f953'
            'a298e1ff099a75d44883a68f2f01e5895b82ce83ff55e22439be768858eeb49b')

package() {
  cd "$srcdir/"

  install -Dm755 viddy "${pkgdir}/usr/bin/viddy"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
