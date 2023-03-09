pkgname=iana-root-hints
pkgver=2023022203
pkgrel=1
pkgdesc="Contains the names and IP addresses of the authoritative name servers for the root zone"
arch=('any')
url="https://www.iana.org/domains/root/files"
license=('unknown')
source=("https://www.internic.net/domain/named.root"{,.sig})

sha256sums=(
    '28e2aec65ff32a69f043db66121c07559bc4f1858e9d539714d2e74299a511b2'
    'SKIP'
)

validpgpkeys=('F0CB1A326BDF3F3EFA3A01FA937BB869E3A238C5')

package() {
    local named="${pkgdir}/var/named"
    # follow 'bind' package permission scheme
    install -dm770 -o 0 -g 40 "${named}"
    install -m640 -o 0 -g 40 -t "${named}" "${source[0]##*/}"
}
