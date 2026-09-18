# Maintainer: Hailey Somerville <hailey@hails.org>

pkgname=lexicon-beta
pkgver=1.11.105
pkgrel=1
arch=(x86_64)
license=(custom)
url=https://www.lexicondj.com/
depends=()
options=("!strip")

source=(
    "https://update.rekord.cloud/releases/lexicon/beta/${pkgname}-${pkgver}-linux-amd64.tar.gz"
)

sha512sums=(
    "0346c3415128a2e8bd5c62537a620a2131b50baa07dae5ec372420cba4a1dd10c129107174642b53ebc11b4157c49bd8809516d802af63639f8495ec1c4646c6"
)

noextract=(
    "${pkgname}-${pkgver}-linux-amd64.tar.gz"
)

package() {
    mkdir -p "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
    tar -xf "${pkgname}-${pkgver}-linux-amd64.tar.gz" -C "${pkgdir}/usr/lib/${pkgname}" --strip-components=1
    mv "${pkgdir}/usr/lib/${pkgname}/share" "${pkgdir}/usr/"
    ln -nsf /usr/lib/lexicon-beta/lexicon-beta "${pkgdir}/usr/bin/lexicon-beta"
}
