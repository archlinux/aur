# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=perl-scripts
pkgname=plage-git
pkgver=22.07.r4.g34f39e2
pkgrel=1
pkgdesc="A message encryption tool, featuring a local keyring, inspired by Age and GnuPG."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
license=('GPL3')
makedepends=('git')

provides=()
conflicts=()

depends=('perl>=5.20.0' 'perl-crypt-cbc' 'perl-cryptx' 'perl-json' 'perl-term-ui' 'perl-term-readkey' 'perl-term-readline-gnu')

source=("git+https://github.com/trizen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -D -m 755 "Encryption/plage.pl" "$pkgdir/usr/bin/plage.pl"
}
