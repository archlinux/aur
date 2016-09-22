# Maintainer:  Joey Pabalinas <alyptik@protonmail.com>
# Contributor:  Joey Pabalinas <alyptik@protonmail.com>

pkgname=fhs-manpages
pkgver=2.2
pkgrel=1
pkgdesc="A manpage for the Filesystem Hierarchy Standard."
arch=('any')
depends=('gzip')
url="https://github.com/alyptik/fhs-manpages"
license=('GPL')
source=("https://github.com/alyptik/${pkgname}/raw/master/fhs.mm")
sha256sums=('833f5950d4e3698bdf5fa71d192d09457a3594d5b2b0b9b626622e7087f4bd7f')
build() {
	cat "$srcdir/fhs.mm" | gzip > "$srcdir/fhs.5.gz"
}
package() {
    install -d "$pkgdir/usr/share/man/man5/"
    install -m 644 "$srcdir/fhs.5.gz" "$pkgdir/usr/share/man/man5/"
}
