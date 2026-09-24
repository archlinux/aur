# Maintainer: Devin Christensen <quixoten@gmail.com>

# shellcheck disable=SC2034,SC2154

pkgname=compat-openssl10
_ver=1.0.2o
# use a pacman compatible version scheme
pkgver=1.0.3
pkgrel=7
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
arch=('x86_64')
url='https://www.openssl.org'
license=('OpenSSL')
source=(
	"https://kojipkgs.fedoraproject.org/vol/fedora_koji_archive06/packages/compat-openssl10/${_ver}/11.fc33/${CARCH}/compat-openssl10-${_ver}-11.fc33.x86_64.rpm"
)
sha256sums=(
	'2e60fb3e1b716e059a99a6b439f634e3372489e1d2608e2e9f776a2b0687f931'
)

package() {
	# Move some files around
	install -m755 -d "$pkgdir/usr/lib"
	install -D -m0644 "$srcdir"/usr/lib64/lib* "$pkgdir"/usr/lib
	install -D -m0644 "$srcdir"/usr/share/licenses/compat-openssl10/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
