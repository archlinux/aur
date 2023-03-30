pkgname=iana-root-hints
pkgver=2023032901
pkgrel=1
pkgdesc="Contains the names and IP addresses of the authoritative name servers for the root zone"
arch=('any')
url="https://www.iana.org/domains/root/files"
license=('unknown')
source=("https://www.internic.net/domain/named.root"{,.sig})

sha256sums=(
    '2ccc1cdd61cb70b5eb5c3e081a2d01d853af7c984e9e707812ea0e414229b060'
    'SKIP'
)

validpgpkeys=('F0CB1A326BDF3F3EFA3A01FA937BB869E3A238C5')

package() {
    local named="${pkgdir}/var/named"
    # follow 'bind' package permission scheme
    install -dm770 -o 0 -g 40 "${named}"
    install -m640 -o 0 -g 40 -t "${named}" "${source[0]##*/}"
}
